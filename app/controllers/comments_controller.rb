class CommentsController < ApplicationController
	before_action :authenticate_user!

	def create
		@post = Post.find(params[:post_id])
		comment = current_user.comments.new(comment_params)
		comment.post_id = @post.id
		comment.save
		# binding.pry
		comment.post.create_notification_comment!(current_user, comment.id)#通知
		flash.now[:success] = "You commented"
	end

	def destroy
		@post = Post.find(params[:post_id])
		comment = Comment.find(params[:id])
		comment.destroy
		flash.now[:danger] = "Comment has been deleted"
	end

	private
	def comment_params
		params.require(:comment).permit(:comment)
	end
end
