class HomeController < ApplicationController
  before_filter :authenticate_user!, :except => [:index]

  def index
    @users = User.all
  end
  
  def beta
    authorize! :beta, @user, :message => 'Not authorized as an administrator.'
    @title = "Special Beta access for admins"
    @users = User.all
  end
  
end
