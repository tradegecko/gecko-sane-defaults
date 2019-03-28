require 'gecko-rails-defaults/railties/deprecations'
require 'gecko-rails-defaults/ext/sidekiq'
require 'gecko-rails-defaults/ext/activejob'

if Rails.env.development?
  require 'gecko-rails-defaults/ext/frozen_string_literal'
end
