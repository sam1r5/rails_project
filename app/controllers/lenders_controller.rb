class LendersController < ApplicationController
  def show
  	@user = User.find(params[:id])
  	@lender = Lender.find_by(user_id: params[:id])
  	@borrowers = Borrower.all
  	@lendings = Lending.all
  	@borrowers_lent = Lending.where(lender_id: @lender.id)
  	@lend_id = @lender.id
  end
end
