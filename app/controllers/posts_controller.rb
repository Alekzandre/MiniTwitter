class PostsController < ApplicationController
	before_filter :load_user
	
	def index
		@posts = Post.all
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

	def edit
		p "----------------------------------------------"
		p params
		p "----------------------------------------------"
		@post = Post.find(params[:id])
	end
 	
 	def update
	    @post = Post.find params[:id]
	    if @post.update_attributes params.require(:post).permit(:user_id, :text, :name)
	      redirect_to user_posts_path(@user)
	    else
	      render :edit
	    end
  	end

	def destroy
		@post  = Post.find(params[:id])
		@post.destroy
    	redirect_to user_posts_path @user
	end

	private

		def load_user
			# ne plus utiliser pour prevent url rewriting
			# @user1 = User.find params[:id]
			@user = current_user
		end
end
