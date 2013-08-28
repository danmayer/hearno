class HomeController < ApplicationController
  before_filter :authenticate_user!, :except => [:index, :about]

  def index
    @campaign_strip = CampaignStrip.find(:first, :offset => rand(CampaignStrip.count))
  end
  
  def beta
    authorize! :beta, @user, :message => 'Not authorized as an administrator.'
    @title = "Special Beta access for admins"
    @users = User.all
    @campaigns = Campaign.all
    @campaign_elements = CampaignElement.all
  end
  
  def about
    @title = "about Hearno"
    @creator = ['Aaron McKay','Dan Mayer','Julio Jimenez','Dan Webb']
  end
  
end