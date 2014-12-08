class CommentsController < ApplicationController
	before_filter :load_user

	def new
		@com = Comment.new
	end

	def create
		@com = @user.post.comment.new params.require(:comment).permit(:text, :name)
		if @com.save
			redirect_to user_post_path(@user)
		end
	end

	private

		def load_user
			p "----------------------------------------------"
			p @user = current_user
			p "----------------------------------------------"
			p @post = Post.find(params[:post_id])
			p "----------------------------------------------"
			# @user1 = User.find(param[:user_id])
		end
end

