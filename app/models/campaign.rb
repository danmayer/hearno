class Campaign < ActiveRecord::Base
  attr_accessible :description, :published, :title, :image
  
  has_attached_file :image, styles: {
    thumb: '100x100>',
    square: '200x200#',
    medium: '300x300>'
  }
end
