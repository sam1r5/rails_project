class SessionsController < ApplicationController
	def create
	  	user = User.find_by_email(params[:user][:email])
	  	if user && user.authenticate(params[:user][:password])
	  		session[:user_id] = user.id
	  		if user.b_or_l == 0
	  			redirect_to "/lenders/#{user.id}"
	  		else
	  			redirect_to "/borrowers/#{user.id}"
	  		end
	  	else
	  		flash[:errors] = "Invalid Combination"
	  		redirect_to :back
	  	end
  	end

	def destroy
		session[:user_id] = nil
		redirect_to "/users/new"
	end

end
