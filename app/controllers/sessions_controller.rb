class SessionsController < ApplicationController

	def new
	end

	def create
		user = User.find_by_name(params[:name])
	if user.present?
	  if user.authenticate(params[:password])
	    session[:user_id] = user.id
	    redirect_to root_url
	    return
      end
    end

    redirect_to sign_in_url, notice: "Invalid username/password combination"
	end

	def destroy
		reset_session
    	redirect_to root_url, notice: "Goodbye"
	end
end
