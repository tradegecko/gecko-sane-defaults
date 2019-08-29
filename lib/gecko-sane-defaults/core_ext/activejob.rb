# frozen_string_literal: true

# No need to log error backtraces, they're already sent to Honeybadger
# See https://github.com/rails/rails/blob/master/activejob/lib/active_job/logging.rb

if ActiveJob::VERSION::STRING.in?(["5.2.3", "6.0.0.rc2", "6.0.0"])
  module ActiveJobLogExt
    def perform(event)
      job = event.payload[:job]
      ex = event.payload[:exception_object]
      if ex
        error do
          "Error performing #{job.class.name} (Job ID: #{job.job_id}) from #{queue_name(event)} in #{event.duration.round(2)}ms: #{ex.class} (#{ex.message}):"
        end
      else
        info do
          "Performed #{job.class.name} (Job ID: #{job.job_id}) from #{queue_name(event)} in #{event.duration.round(2)}ms"
        end
      end
    end
  end

  require 'active_job/base'
  ActiveJob::Logging::LogSubscriber.prepend(ActiveJobLogExt)
else
  puts("Could not find monkey-patch for activejob-#{ActiveJob::VERSION::STRING} in gecko-sane-defaults.")
end
