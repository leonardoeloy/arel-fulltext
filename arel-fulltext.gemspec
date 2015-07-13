# # -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "arel"
require "rake"

Gem::Specification.new do |s|
  s.name        = "arel-fulltext"
  s.version     = '1.0.0'
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Leonardo Eloy"]
  s.email       = ["leonardo.eloy@gmail.com"]
  s.homepage    = "https://github.com/leonardoeloy/arel-fulltext"
  s.description = "Adds MySQL Full-Text Search support to Arel"
  s.summary     = "Adds MySQL Full-Text Search support to Arel"
  s.license     = %q{MIT}

  s.rdoc_options = ["--main", "README.md"]
  s.extra_rdoc_files = ["LICENSE", "README.md"]

  s.files         = FileList['**/*.rb', 'LICENSE', 'README.md'].to_a
  s.require_paths = ["lib"]

  s.add_development_dependency('minitest', '~> 5.4')
  s.add_development_dependency('rdoc', '~> 4.0')
  s.add_development_dependency('arel', '>= 6.0')
  s.add_development_dependency('rake')
end