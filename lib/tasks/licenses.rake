# frozen_string_literal: true

namespace :licenses do
  desc 'Validate licenses in Gemfile. For custom overrides, define a lib/config/licenses.rb file in the application.'

  task validate: :environment do
    require 'papers'
    require 'gecko-sane-defaults/config/licenses'
    require Rails.root.join('lib/config/licenses') if File.exist?(Rails.root.join('lib/config/licenses.rb'))

    Papers::ManifestUpdater.new.update!
    validator = Papers::LicenseValidator.new

    if validator.valid?
      puts 'License validation succeeded'
    else
      abort "License validation failed:\n#{validator.errors.join("\n")}"
    end
  end
end
