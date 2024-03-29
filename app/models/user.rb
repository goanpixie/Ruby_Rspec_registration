class User < ActiveRecord::Base
  email_regex = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :first_name, :presence => true
  validates :last_name, :presence => true
  validates :email, :presence => true
  validates :password, :presence => true
  validates :email, :uniqueness => true, :format => { :with => email_regex }

  has_secure_password
  validates_length_of :password, :minimum => 6
end

