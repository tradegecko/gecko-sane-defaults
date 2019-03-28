module GeckoRailsDefaults
end

if defined?(Rails)
  require 'gecko-rails-defaults/railties/deprecations'
  require 'gecko-rails-defaults/core_ext/activejob' if defined?(ActiveJob)

  if Rails.env.development?
    require 'gecko-rails-defaults/core_ext/frozen_string_literal'
  end
end

require 'gecko-rails-defaults/core_ext/sidekiq' if defined?(Sidekiq)
