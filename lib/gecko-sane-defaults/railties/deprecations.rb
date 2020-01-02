# frozen_string_literal: true

module GeckoSaneDefaults
  class Deprecations < Rails::Railtie
    initializer 'gecko-sane-defaults.deprecations', before: "active_support.deprecation_behavior" do |app|
      if Rails.env.production?
        app.config.active_support.deprecation = lambda { |message, callstack|
          ex = ActiveSupport::DeprecationException.new(message)
          ex.set_backtrace(callstack.map(&:to_s))
          Honeybadger.notify(ex)
        }
      elsif !Rails.env.test?
        app.config.active_support.deprecation = :raise
      end
    end
  end
end
