class Photo < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :photo_album, :polymorphic => true

  has_attached_file :image, :styles => { :medium => "640x480>", :thumb => "100x100#" }
  attr_accessible :image, :photos_attributes
end
