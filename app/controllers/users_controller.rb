class UsersController < ApplicationController
  def index
  end

  def new
  end

  def show
  end

  def create
  	user = User.new(user_params)
  	if user.save
  		if params[:type] == "lender"
        Lender.create(money: params[:money], user_id: user.id)
        redirect_to "users/new"
      else
        Borrower.create(need_money_for: params[:need_money_for], description: params[:description],amount_needed: params[:amount_needed],user_id: user.id)
        redirect_to "users/new"
      end
  	else
  		flash[:errors] = user.errors.full_messages
      redirect_to :back
  	end
  end
  	private
  		def user_params
  			if params[:type] == "lender"
	  			params.require(:lender).permit(:first_name, :last_name, :email, :password, :password_confirmation).merge(b_or_l: 0)
	  		else
	  			params.require(:borrower).permit(:first_name, :last_name, :email, :password, :password_confirmation).merge(b_or_l: 1)
	  		end
  		end
end
