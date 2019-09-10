# coding: utf-8

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'gecko-sane-defaults/version'

Gem::Specification.new do |s|
  s.name        = 'gecko-sane-defaults'
  s.version     = GeckoSaneDefaults::VERSION
  s.description = 'Some sane defaults for TradeGecko apps'
  s.summary     = s.description
  s.files       = ['lib/gecko-sane-defaults.rb']
  s.executables << 'semaphore-ruby'
  s.homepage    = 'http://rubygems.org/gems/gecko-sane-defaults'
  s.license     = 'MIT'
  s.authors     = ['Bradley Priest']
end
