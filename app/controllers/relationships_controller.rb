class RelationshipsController < ApplicationController
	before_filter :signed_in_user

	def create
		@user = User.find(params[:relationship][:followed_id])
		User.find(session[:user_id]).follow!(@user)
		redirect_to @user
	end

	def destroy
		@user = Relationship.find(params[:id]).followed
		User.find(session[:user_id]).unfollow!(@user)
		redirect_to @user
	end
end