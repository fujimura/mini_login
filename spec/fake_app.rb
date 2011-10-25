# Stolen from https://github.com/amatsuda/kaminari/blob/master/spec/fake_app.rb
# Thanks a_matsuda ;-)

require 'active_record'
require 'action_dispatch'
require 'action_controller'
require 'action_controller/railtie'
require 'login'


# database
ActiveRecord::Base.configurations = {
  'test' => {
    :adapter  => 'sqlite3',
    :database => File.join(File.dirname(__FILE__), 'db')
  }
}
ActiveRecord::Base.establish_connection('test')

# config
app = Class.new(Rails::Application)
app.config.secret_token = "3b7cd727ee24e8444053437c36cc66c4"
app.config.secret_token = "3csos08ef99qwed99vjaskf9urjeeeel"
app.config.session_store :cookie_store, :key => "_myapp_session"
app.config.active_support.deprecation = :log
app.config.root = File.join(File.dirname(__FILE__))
app.initialize!

# routes
app.routes.draw do
  root :to => 'users#index'
  resources :users
end

# models
class User < ActiveRecord::Base
end

# controllers
class ApplicationController < ActionController::Base
  include Login
end

# helpers
Object.const_set(:ApplicationHelper, Module.new)

#migrations
class CreateAllTables < ActiveRecord::Migration
  def self.up
    create_table(:users) do |t|
      t.string "email"
    end
  end
end
