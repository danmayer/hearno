class CampaignElement < ActiveRecord::Base
  belongs_to :campaign_strip
  attr_accessible :description, :picture, :title

end
