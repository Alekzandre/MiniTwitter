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

	def follow
  		@user = User.find(params[:id])

  		if current_user
    		if current_user == @user
      			flash[:error] = "You cannot follow yourself."
    		else
      			current_user.follow(@user)
      			RecommenderMailer.new_follower(@user).deliver if @user.notify_new_follower
      		end
  		end
	end

	def unfollow
  		@user = User.find(params[:id])

  		if current_user
    		current_user.stop_following(@user)
  		end
	end
end
