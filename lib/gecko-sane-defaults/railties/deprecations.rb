# frozen_string_literal: true

module GeckoSaneDefaults
  class Deprecations < Rails::Railtie
    ActiveSupport::Notifications.subscribe('deprecation') do |_, _, _, _, payload|
      ex = ActiveSupport::DeprecationException.new(payload[:message])
      ex.set_backtrace(payload[:callstack].map(&:to_s))
      Honeybadger.notify(ex)
    end

    initializer 'gecko-sane-defaults.deprecations', before: "active_support.deprecation_behavior" do |app|
      if Rails.env.production?
        app.config.active_support.deprecation = :notify
      else
        app.config.active_support.deprecation = :raise
      end
    end
  end
end
