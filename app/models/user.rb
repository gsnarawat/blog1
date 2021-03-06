class User < ActiveRecord::Base
  attr_accessible :email, :name, :password
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :name, :presence => true
  validates :email, :presence => true, format: { with: VALID_EMAIL_REGEX }, :uniqueness => { :case_sensitive => false }
  validates :password, :presence => true, :length => {:minimum => 6}

end
