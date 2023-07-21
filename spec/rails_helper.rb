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

WebMock.allow_net_connect!(allow_localhost: true)

Dir[Rails.root.join('spec', 'support', '**', '*.rb')].each { |f| require f }

begin
  ActiveRecord::Migration.maintain_test_schema!
rescue ActiveRecord::PendingMigrationError => e
  puts e.to_s.strip
  exit 1
end

Capybara.register_driver :chrome_headless do |app|
  chrome_capabilities = Selenium::WebDriver::Remote::Capabilities.chrome(
    'goog:chromeOptions' => {
      args: %w[no-sandbox headless disable-gpu window-size=1400,1400]
    }
  )

  if ENV['HUB_URL']
    Capybara::Selenium::Driver.new(app,
                                   browser: :remote,
                                   url: ENV['HUB_URL'],
                                   capabilities: chrome_capabilities)
  else
    Capybara::Selenium::Driver.new(app,
                                   browser: :chrome,
                                   capabilities: chrome_capabilities)
  end
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

  config.include FactoryBot::Syntax::Methods

  config.filter_gems_from_backtrace 'factory_bot' unless ENV['FULLTRACE']

  config.before(:each, type: :turbo) do
    config.include Rails.application.routes.url_helpers
    config.include Capybara::DSL
    Capybara.default_driver = :chrome_headless
    Capybara.app_host = "http://#{IPSocket.getaddress(Socket.gethostname)}:3000"
    Capybara.server_host = IPSocket.getaddress(Socket.gethostname)
    Capybara.server_port = 3000
  end

  config.before(:each, type: :feature) do
    Capybara.default_driver = :rack_test
  end
end
