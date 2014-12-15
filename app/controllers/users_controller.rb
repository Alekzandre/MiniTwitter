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
      			redirect_to :back, :notice => "successfully followed someone..."
    		else
      			current_user.follow(@user)
      			flash[:notice] = "You are now following."
      			redirect_to :back, :notice => "successfully followed someone..."
    		end
  		else
    		flash[:error] = "You must <a href='/users/sign_in'>login</a> to follow.".html_safe
  			redirect_to :back, :notice => "successfully followed someone..."
  		end
	end

	def unfollow
  		@user = User.find(params[:id])

  		if current_user
    		current_user.stop_following(@user)
    		flash[:notice] = "You are no longer following ."
    		redirect_to :back, :notice => "successfully followed someone..."
  		else
    		flash[:error] = "You must <a href='/users/sign_in'>login</a> to unfollow.".html_safe
  			redirect_to :back, :notice => "successfully followed someone..."
  		end
	end
end
