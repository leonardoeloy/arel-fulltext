# Gracefully stolen from https://github.com/rails/arel/blob/master/test/helper.rb

require 'rubygems'
require 'minitest/autorun'
require 'fileutils'
require 'arel'
require 'arel-fulltext'

require 'support/fake_record'
#Arel::Table.engine = FakeRecord::Base.new