class HomeController < ApplicationController
  before_filter :authenticate_user!, :except => [:beta]

  def index
    @users = User.all
  end

  def beta
    @title = "Special Beta access for admins"
  end

end
