class Borrower < ActiveRecord::Base
  belongs_to :user
  has_many :lendings
end
