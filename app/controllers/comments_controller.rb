class CommentsController < ApplicationController

	def create
		@post = Post.find(params[:post_id])
		comment = current_user.comments.new(comment_params)
		comment.post_id = @post.id
		comment.save
		# binding.pry
		comment.post.create_notification_comment!(current_user, comment.id)#通知
		respond_to do |format|
			format.js {flash[:notice] = "You commented"}
		end
	end

	def destroy
		@post = Post.find(params[:post_id])
		comment = Comment.find(params[:id])
		comment.destroy
		respond_to do |format|
		    format.js {flash[:notice] = "Comment has been deleted"}
		end
	end

	private
	def comment_params
		params.require(:comment).permit(:comment)
	end
end
