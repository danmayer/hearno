class HomeController < ApplicationController
  before_filter :authenticate_user!, :except => [:index, :about]

  def index
    @users = User.all
  end
  
  def beta
    authorize! :beta, @user, :message => 'Not authorized as an administrator.'
    @title = "Special Beta access for admins"
    @users = User.all
    @campaigns = Campaign.all
  end
  
  def about
    @title = "about Hearno"
    @creator = ['Aaron McKay','Dan Mayer','Julio Jimenezz']
  end
  
end
