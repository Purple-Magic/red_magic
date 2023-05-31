# frozen_string_literal: true

require 'spec_helper'
ENV['RAILS_ENV'] = 'test'

begin
  require_relative '../config/environment'
rescue StandardError
  exit(1)
end

abort('The Rails environment is running in production mode!') if Rails.env.production?

require 'rspec/rails'
require 'capybara/rspec'
require 'webmock/rspec'
require 'sidekiq/testing'

Dir[Rails.root.join('spec', 'support', '**', '*.rb')].each { |f| require f }

begin
  ActiveRecord::Migration.maintain_test_schema!
rescue ActiveRecord::PendingMigrationError => e
  puts e.to_s.strip
  exit 1
end

RSpec.configure do |config|
  config.include ActiveJob::TestHelper
  config.include FactoryBot::Syntax::Methods

  config.after do
    clear_enqueued_jobs
    clear_performed_jobs
  end

  config.fixture_path = Rails.root.join('spec', 'fixtures')
  config.use_transactional_fixtures = true

  config.infer_spec_type_from_file_location!
  config.filter_rails_from_backtrace!

  config.include FactoryBot::Syntax::Methods

  unless ENV['FULLTRACE']
    config.filter_gems_from_backtrace 'railties', 'rack', 'rack-test'
    config.filter_gems_from_backtrace 'factory_bot'
  end
end
