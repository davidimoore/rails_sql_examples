# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
Dir[Rails.root.join("spec/support/**/*.rb")].sort.each { |file| require file }
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'spec_helper'
require 'rspec/rails'
require 'rspec/mocks'
require 'shoulda/matchers'
require 'database_cleaner'
ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|

  config.use_transactional_fixtures = true
  config.infer_spec_type_from_file_location!
  config.include FactoryGirl::Syntax::Methods
  ActiveRecord::Migration.maintain_test_schema!
  ActiveRecord::Migration.check_pending!
end