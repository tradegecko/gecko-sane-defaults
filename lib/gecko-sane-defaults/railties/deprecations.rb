# frozen_string_literal: true

module GeckoSaneDefaults
  class Deprecations < Rails::Railtie
    initializer 'gecko-sane-defaults.deprecations' do |app|
      if Rails.env.production?
        app.config.active_support.deprecation = lambda { |message, callstack|
          ex = ActiveSupport::DeprecationException.new(message)
          ex.set_backtrace(callstack.map(&:to_s))
          Honeybadger.notify(ex)
        }
      else
        app.config.active_support.deprecation = :raise
      end
    end
  end
end
