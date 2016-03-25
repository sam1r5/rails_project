class LendingsController < ApplicationController
  def create
  	lending = Lending.new(lending_params)
	  	if lending.save
	  		lender = Lender.find_by(user_id: session[:user_id])
	  		borrower = Borrower.find(params[:lend][:borrower_id])
	  		Lender.find(lender.id).update(money: ((lender.money)-(params[:lend][:amount_lent]).to_f))
			Borrower.find(params[:lend][:borrower_id]).update(amount_needed: (borrower.amount_needed - (params[:lend][:amount_lent]).to_f))	  	
		  	redirect_to :back
	    else
	    	fail
	    end
  end

  private
  	def lending_params
  		lender = Lender.find_by(user_id: session[:user_id])
  		params.require(:lend).permit(:amount_lent, :borrower_id).merge(lender_id: lender.id)
  	end
end
