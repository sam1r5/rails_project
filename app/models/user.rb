class User < ActiveRecord::Base
  has_secure_password
  has_one :lender, dependent: :destroy
  has_many :borrowers, dependent: :destroy
  email_regex = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :first_name, :last_name, :email, :presence => true 
  validates :email, :presence => true, :format => { :with => email_regex }, :uniqueness => { :case_sensitive => false }
  validates :password, :length => {minimum: 8}, :on => :create 
end
