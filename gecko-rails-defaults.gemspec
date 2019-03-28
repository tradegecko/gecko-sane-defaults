# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'gecko-rails-defaults/version'

Gem::Specification.new do |s|
  s.name        = 'gecko-rails-defaults'
  s.version     = GeckoRailsDefaults::VERSION
  s.description = 'Some sane defaults for TradeGecko apps'
  s.files       = ['lib/gecko-rails-defaults.rb']
  s.homepage    = 'http://rubygems.org/gems/gecko-rails-defaults'
  s.license     = 'MIT'
end
