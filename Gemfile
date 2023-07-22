# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.2.2'

gem 'rails', github: 'rails/rails', ref: 'main'

gem 'bootsnap', require: false
gem 'haml-rails'
gem 'importmap-rails'
gem 'jbuilder'
gem 'pg', '~> 1.1'
gem 'puma', '>= 5.0'
gem 'redis', '>= 4.0.1'
gem 'sprockets-rails'
gem 'stimulus-rails'
gem 'turbo-rails'
gem 'tzinfo-data', platforms: %i[windows jruby]

# gem 'tramway', '0.2.1.3'
gem 'tramway', path: 'vendor/tramway'
gem 'view_component'

group :development do
  gem 'debug', platforms: %i[mri mingw x64_mingw]
  gem 'error_highlight', '>= 0.4.0', platforms: [:ruby]
  gem 'rubocop', require: false
  gem 'web-console'
end

group :test do
  gem 'capybara'
  gem 'pry'
  gem 'rspec-rails'
  gem 'selenium-webdriver'
  gem 'webdrivers'
end

gem 'enumerize', '~> 2.6'

gem 'anycable-rails', '~> 1.3'

gem 'sidekiq', '~> 7.0'

gem 'newrelic_rpm', '~> 9.1'

gem 'aws-sdk-s3', '~> 1.121'

gem 'devise', '~> 4.9'

gem 'webmock', '~> 3.18'

gem 'factory_bot_rails', '~> 6.2'

gem 'faker', '~> 3.2'
