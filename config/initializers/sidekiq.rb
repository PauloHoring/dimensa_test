# frozen_string_literal: true

require 'sidekiq/cron'

schedule = 'config/schedule.yml'

Sidekiq::Cron::Job.load_from_hash YAML.load_file(schedule) if File.exist?(schedule) && Sidekiq.server?
