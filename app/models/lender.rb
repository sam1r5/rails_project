class Lender < ActiveRecord::Base
  belongs_to :user
  has_many :lendings
end
