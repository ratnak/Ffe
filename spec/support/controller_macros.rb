module ControllerMacros
#  def login_admin
#    before(:each) do
#      @request.env["devise.mapping"] = Devise.mappings[:admin]
#      admin = FactoryGirl.create(:admin) # Using factory girl as an example
#      admin.roles << FactoryGirl.create(:admin_role)
#      admin.save
#      sign_in admin
#      @current_user = admin
#    end
#  end

  def login_user
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      user = FactoryGirl.create(:user)
      #user.confirm! # or set a confirmed_at inside the factory. Only necessary if you are using the confirmable module
      sign_in user
      @current_user = user
    end
  end
end
