$LOAD_PATH.unshift(File.dirname(__FILE__))

require 'factory_girl'
require 'shoulda'
require 'database_cleaner'
require File.join(File.dirname(__FILE__), 'factories')
require File.join(File.dirname(__FILE__), 'fake_app')
require 'rspec/rails'
#require File.join(File.dirname(__FILE__), 'support', 'matchers')

RSpec.configure do |config|
  config.mock_with :rspec

  config.before :all do
    CreateAllTables.up unless ActiveRecord::Base.connection.table_exists? 'users'
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end

end
