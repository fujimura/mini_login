require "login/version"


module Login
  class Unauthorized < StandardError; end

  # Do configurations
  #
  # Available Configurations are:
  #
  # [identifier_attribute] Attribute to identify user. This should be unique. Default is +:id+
  #
  #     Login.configure do |c|
  #       c.identifier_attribute = :email
  #     end
  #
  def self.configure
    yield self
  end

  mattr_accessor :identifier_attribute
  @@identifier_attribute = :id

  extend ActiveSupport::Concern

  included do |base|
    base.class_eval do
      helper_method :current_user
    end
  end

  module ClassMethods
  end

  module InstanceMethods

    # Store user id(or configured attribute) in session.
    #
    # @raise +Unauthorized+ Can't authorize user with given value.
    def login!(user)
      raise Unauthorized unless user
      identifier = case user
                   when ActiveRecord::Base
                     user[self.identifier_attribute]
                   else
                     user
                   end

      session[identifier_name] = identifier

      # for session fixation attacks
      # TODO make configurable
      request.session_options[:renew] = true
    end

    # Return current_user.
    # If it does not exist, returns nil.
    #
    # @return user or nil
    def current_user
      @current_user ||= ::User.send("find_by_#{self.identifier_attribute}!", session[identifier_name])
    rescue ActiveRecord::RecordNotFound
      nil
    end

    # Return current_user exists or not.
    #
    # @return [Boolean] True if user is logged in.
    def logged_in?
      !current_user.blank?
    end

    # Delete current_user from database and session.
    #
    def logout!
      return unless current_user
      reset_session
      @current_user = nil
    end

    private
    def identifier_name
      "current_user_#{self.identifier_attribute}".to_sym
    end

  end
end
