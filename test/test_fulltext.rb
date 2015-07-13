require 'helper'

describe Arel do
  before do
    @table = Arel::Table.new(:people)
    @attr = @table[:name]
    @conn = FakeRecord::Base.new
  end

  def compile node
    @visitor.accept(node, Arel::Collectors::SQLString.new).value
  end

  describe 'MySQL' do
    before do
      @visitor = Arel::Visitors::MySQL.new @conn.connection
    end

    it 'creates full-text query' do
      sql = compile @attr.match('Morse')
      sql.must_equal %{MATCH("people"."name") AGAINST('Morse')}
    end

    it 'creates full-text query in boolean mode' do
      sql = compile @attr.match('Morse', :boolean_mode => true)
      sql.must_equal %{MATCH("people"."name") AGAINST('Morse' IN BOOLEAN MODE)}
    end

    it 'creates full-text query with query expansion' do
      sql = compile @attr.match('Morse', :query_expansion => true)
      sql.must_equal %{MATCH("people"."name") AGAINST('Morse' WITH QUERY EXPANSION)}
    end
  end

  describe 'To SQL' do
    before do
      @visitor = Arel::Visitors::ToSql.new @conn.connection
    end

    it 'falls back to LIKE when database is not supported' do
      sql = compile @attr.match('Morse')
      sql.must_equal %{"people"."name" LIKE 'Morse'}
    end
  end
end