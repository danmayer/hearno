RSpec.configure do |config|
  config.include Devise::TestHelpers, :type => :controller

  def login_admin
    @request.env["devise.mapping"] = Devise.mappings[:admin]
    user = User.where(:email =>'admin@example.com').first || FactoryGirl.create(:admin) # Using factory girl as an example
    sign_in user
    user
  end
  
  def login_user
    @request.env["devise.mapping"] = Devise.mappings[:user]
    user = User.first || FactoryGirl.create(:user)
    #user.confirm! # or set a confirmed_at inside the factory. Only necessary if you are using the confirmable module
    sign_in user
    user
  end

end
