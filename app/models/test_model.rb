require 'tableless.rb'
class TestModel < ActiveRecord::Base
  # attr_accessible :title, :body
  include Tableless

  column :id, :string
  column :name, :string
  column :email, :string
  column :mobile, :string

  attr_accessible :name, :email, :mobile

  validate :check_required_fields
  validate :email_format
  #validates :name, :presence => { true, :message => "Name cannot be blank." }
  #validates :email, :presence => { true, :message => "Email cannot be blank." }


  def check_required_fields
  	self.errors.add(:name, "Name cannot be blank.") if self.name.blank?
    self.errors.add(:email, "Email cannot be blank.") if self.email.blank?
  end

  def email_format
    unless self.email.blank?
      unless (/\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i).match(self.email)
        self.errors.add(:email, "Email should be in proper format.")
      end
    end
  end

end
