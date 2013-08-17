class CampaignElement < ActiveRecord::Base
  belongs_to :campaign_strip
  attr_accessible :description, :picture, :title

  # This method associates the attribute ":picture" with a file attachment
  has_attached_file :picture, styles: {
    thumb: '100x100>',
    square: '200x200#',
    medium: '300x300>'
  }

end
