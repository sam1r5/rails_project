class BorrowersController < ApplicationController
  def show
  	@user = User.find(params[:id])
  	@borrower = Borrower.find_by(user_id: params[:id])
  	@lent_users = Lending.where(borrower_id: @borrower.id)
  end
end
