require 'arel'
require 'arel-fulltext/nodes/full_text_match'
require 'arel-fulltext/visitors/mysql'
require 'arel-fulltext/visitors/to_sql'

module Arel
  module Predications
    def match value, opts = nil
      Nodes::FullTextMatch.new self, value, opts
    end
  end
end