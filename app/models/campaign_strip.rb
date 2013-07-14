class CampaignStrip < ActiveRecord::Base
  belongs_to :creator, :class_name => "User"
  belongs_to :parent, :class_name => "CampaignStrip"
  belongs_to :campaign
  attr_accessible :description, :title, :creator_id, :parent_id, :campaign_id
  
  validates :creator_id, :presence => {:message => "Requires login to be created, and assigned to logged in user. How did you do this!"}
  validates :campaign_id, :presence => {:message => "Only one campaign, How did you do this!"}
  validates :title, :presence => true
end
