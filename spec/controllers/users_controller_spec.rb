require 'spec_helper'

describe UsersController do
  login_user
#  before (:each) do
#    @user = FactoryGirl.create(:user)
#  end

  describe "GET 'show'" do
    
    it "should be successful" do
      get :show, :id => @current_user.id
      response.should be_success
    end
    
    it "should find the right user" do
      get :show, :id => @current_user.id
      assigns(:user).should == @current_user
    end
    
  end

end
