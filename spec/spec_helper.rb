ENV["RACK_ENV"] ||= "test"

require File.expand_path("../../config/environment", __FILE__)
require 'rspec'
require 'capybara/dsl'
require 'database_cleaner'
require 'pry'
require 'bundler'
Bundler.require(:default, :test)

Capybara.app = BikeShareApp
Capybara.save_and_open_page_path = 'tmp/capybara'

DatabaseCleaner.strategy = :truncation

RSpec.configure do |c|
  c.before(:each) do
    DatabaseCleaner.clean
  end
  c.after(:each) do
    DatabaseCleaner.clean
  end
  c.include Capybara::DSL
end
