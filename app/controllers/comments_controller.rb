class CommentsController < ApplicationController
	before_filter :load_user

	def new
		@com = Comment.new
	end

	def create
		@com = @post.comments.new params.require(:comment).permit(:text)
			if @com.save
				redirect_to user_posts_path(@user)
			else
				render :new
			end
	end

	private

		def load_user
			@user = current_user
 			@post = Post.find(params[:post_id])

		end
end
