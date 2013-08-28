class CampaignStrip < ActiveRecord::Base
  belongs_to :creator, :class_name => "User"
  belongs_to :parent, :class_name => "CampaignStrip"
  belongs_to :campaign
  has_many   :campaign_elements
  attr_accessible :description, :title, :creator_id, :parent_id, :campaign_id, :campaign_elements_attributes
  
  accepts_nested_attributes_for :campaign_elements, allow_destroy: true

  validates :creator_id, :presence => {:message => "Requires login to be created, and assigned to logged in user. How did you do this!"}
  validates :campaign_id, :presence => {:message => "Only one campaign, How did you do this!"}
  validates :title, :presence => true

  def self.default_strip
    campaign_strip = CampaignStrip.new
    elements = ['Hear No', "See No", "Speak No"].map do |el|
      CampaignElement.new(:title => el)
    end
    campaign_strip.campaign_elements = elements
    campaign_strip
  end
  
  def image_or_default(image_position = 0)
    campaign_elements[image_position].try(:picture)  || ActionController::Base.helpers.image_path('Hearno_logoicon.png')
  end
  
  def title_or_default(title_position = 0)
    default_title = case title_position 
      when 0 
        "Hear No"
      when 1
        "See No"
      when 2
        "Speak No"
    end
    campaign_elements[title_position].try(:title)  || default_title
  end
  
  
  
end
