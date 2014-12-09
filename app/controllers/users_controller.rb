class UsersController < ApplicationController

	def index
		@users = User.all
		@user = current_user
	end

	def show
		p "----------------------------------"
		p params
		p "----------------------------------"
		@user = User.find(params[:id])
		p @user

	end
end
