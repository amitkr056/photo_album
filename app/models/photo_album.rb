class PhotoAlbum < ActiveRecord::Base
  # attr_accessible :title, :body
  extend FriendlyId
  friendly_id :name
  
  belongs_to :user
  has_many :photos

  accepts_nested_attributes_for :photos, :allow_destroy => true
  attr_accessible :name, :attached_assets_attributes, :photos_attributes, :photos
  validates :name, presence: true


end