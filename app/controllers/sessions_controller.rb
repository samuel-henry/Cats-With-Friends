class SessionsController < ApplicationController

	def new
	end

	def create
		user = User.find_by_name(params[:name])

		#verify the signing in user exists
		if user.present?
			#authenticate the entered password
		  	if user.authenticate(params[:password])
		  		#create session
			    session[:user_id] = user.id

			    #redirect to home
			    redirect_to root_url
		    	return
	    	end
    	end

	    #authentication failed for some reason. don't tell user specific failure(s)
	    redirect_to sign_in_url, notice: "Invalid username/password combination"
	end

	def destroy
		reset_session
    	redirect_to root_url, notice: "Goodbye"
	end
end
