source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.2.2"

gem "rails", github: "rails/rails", ref: 'main'

gem "sprockets-rails"
gem "pg", "~> 1.1"
gem "puma", ">= 5.0"
gem "importmap-rails"
gem "turbo-rails"
gem "stimulus-rails"
gem "jbuilder"
gem "redis", ">= 4.0.1"
gem "tzinfo-data", platforms: %i[ windows jruby ]
gem "bootsnap", require: false
gem "haml-rails"

gem "tramway", '0.1.3.1'
gem "view_component"

group :development, :test do
  gem "debug", platforms: %i[ mri windows ]
end

group :development do
  gem "web-console"
  gem "error_highlight", ">= 0.4.0", platforms: [:ruby]
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
  gem "webdrivers"
  gem 'rspec-rails'
end

gem "enumerize", "~> 2.6"

gem "anycable-rails", "~> 1.3"

gem "sidekiq", "~> 7.0"

gem "newrelic_rpm", "~> 9.1"

gem "aws-sdk-s3", "~> 1.121"

gem "devise", "~> 4.9"

gem "webmock", "~> 3.18"

gem "factory_bot_rails", "~> 6.2"

gem "faker", "~> 3.2"
