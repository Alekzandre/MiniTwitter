class PostsController < ApplicationController
	before_filter :load_user
	
	def index
		@posts = @user.posts
	end
	
	def show
		@post  = Post.find(params[:id])
	end
	
	def new
		@post = Post.new
	end
	
	def create
		 @post = @user.posts.new params.require(:post).permit(:text, :name)
			if @post.save
				redirect_to user_posts_path(@user)
			else
				render :new
			end
	end

	private

		def load_user
			# ne plus utiliser pour prevent url rewriting
			# @user = User.find params[:user_id]
			@user = current_user
		end
end
