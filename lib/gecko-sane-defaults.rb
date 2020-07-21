# frozen_string_literal: true

module GeckoSaneDefaults
end

if defined?(Rails)
  require 'gecko-sane-defaults/railties/deprecations'
  require 'gecko-sane-defaults/core_ext/activejob' if defined?(ActiveJob)

  if Rails.env.development? || Rails.env.test?
    require 'gecko-sane-defaults/railties/tasks'
    require 'gecko-sane-defaults/core_ext/frozen_string_literal'
  end
end

require 'gecko-sane-defaults/core_ext/sidekiq' if defined?(Sidekiq)
