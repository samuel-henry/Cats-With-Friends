class RelationshipsController < ApplicationController
	#before_filter :signed_in_user

	def create
		@user = User.find(params[:relationship][:followed_id])
		User.find(session[:user_id]).follow!(@user)

		respond_to do |format|
			format.html { redirect_to @user }
			format.js
		end
	end

	def destroy
		@user = Relationship.find(params[:id]).followed
		User.find(session[:user_id]).unfollow!(@user)
		
		respond_to do |format|
			format.html { redirect_to @user }
			format.js
		end
	end
end