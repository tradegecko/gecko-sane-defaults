# frozen_string_literal: true

module GeckoSaneDefaults
  class Tasks < Rails::Railtie
    rake_tasks do
      load 'tasks/licenses.rake'
    end
  end
end
