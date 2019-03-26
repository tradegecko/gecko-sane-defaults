module GeckoRailsDefaults
  module SidekiqLogger
    def call(ex, ctxHash)
      Sidekiq.logger.warn(Sidekiq.dump_json(ctxHash)) if !ctxHash.empty?
      Sidekiq.logger.warn("#{ex.class.name}: #{ex.message}")
      # Sidekiq.logger.warn(ex.backtrace.join("\n")) unless ex.backtrace.nil?
    end
  end
end

Sidekiq::ExceptionHandler::Logger.include(GeckoRailsDefaults::SidekiqLogger)
