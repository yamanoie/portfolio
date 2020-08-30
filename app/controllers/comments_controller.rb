class CommentsController < ApplicationController

	def create
		post = Post.find(params[:post_id])
		comment = current_user.comments.new(comment_params)
		comment.post_id = post.id
		comment.save
		redirect_to post_path(post),notice: "You commented"
	end

	def destroy
		comment = Comment.find(params[:id])
		comment.destroy
		redirect_to request.referer,notice: "Comment has been deleted"
	end

	private
	def comment_params
		params.require(:comment).permit(:comment)
	end
end
