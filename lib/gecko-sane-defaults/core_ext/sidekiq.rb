# frozen_string_literal: true

# No need to log error backtraces, they're already sent to Honeybadger
# See https://github.com/rails/rails/blob/master/activejob/lib/active_job/logging.rb

module GeckoSaneDefaults
  module SidekiqLogger
    def call(ex, ctxHash)
      Sidekiq.logger.warn(Sidekiq.dump_json(ctxHash)) if !ctxHash.empty?
      Sidekiq.logger.warn("#{ex.class.name}: #{ex.message}")
      # Sidekiq.logger.warn(ex.backtrace.join("\n")) unless ex.backtrace.nil?
    end
  end
end

require 'sidekiq/exception_handler'

Sidekiq::ExceptionHandler::Logger.prepend(GeckoSaneDefaults::SidekiqLogger)
