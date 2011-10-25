
require 'spec_helper'

describe ApplicationController do
  include RSpec::Rails::ControllerExampleGroup
  let(:user) { FactoryGirl.create :user }

  describe '#login!' do
    context 'with user' do
      it 'should login ' do
        controller.login! user
        session[:current_user_id].should == user.id
      end
    end
    context 'without user' do
      it 'should raise Unauthorized ' do
        expect do
          controller.login! nil
        end.to raise_error Unauthorized
      end
    end
  end

  describe '#current_user' do
    context 'with valid session stored' do
      it 'should return current_user ' do
        session[:current_user_id] = user.id
        controller.current_user.should == user
      end
    end
    context 'with no session stored' do
      it 'should return current_user ' do
        controller.current_user.should == nil
      end
    end
  end

  describe '#logged_in?' do
    context 'with current_user' do
      it 'should return true ' do
        controller.stub(:current_user).and_return user
        controller.should be_logged_in
      end
    end
    context 'without current_user' do
      it 'should return true ' do
        controller.stub(:current_user).and_return nil
        controller.should_not be_logged_in
      end
    end
  end

  describe '#logout!' do
    before do
      controller.login! user
    end
    it 'should reset session' do
      controller.should_receive(:reset_session)
      controller.logout!
    end
    it 'should remove @current_user' do
      controller.logout!
      controller.instance_variable_get('@current_user').should be_nil
    end
  end
end
