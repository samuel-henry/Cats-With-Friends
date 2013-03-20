class RelationshipsController < ApplicationController
	
	#create a new follow relationship
	def create
		#get user to follow
		@user = User.find(params[:relationship][:followed_id])

		#follow user. raise exception on failure
		User.find(session[:user_id]).follow!(@user)

		respond_to do |format|
			format.html { redirect_to @user }
			format.js
		end
	end

	def destroy
		#get user to unfollow
		@user = Relationship.find(params[:id]).followed

		#unfollow @user. raise exception on failure
		User.find(session[:user_id]).unfollow!(@user)
		
		respond_to do |format|
			format.html { redirect_to @user }
			format.js
		end
	end
end