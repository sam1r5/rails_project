class Lending < ActiveRecord::Base
  belongs_to :borrower
  belongs_to :lender
end
