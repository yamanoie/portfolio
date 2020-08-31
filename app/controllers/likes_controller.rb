class LikesController < ApplicationController
	def create
		post = Post.find(params[:post_id])
		like = current_user.likes.new(post_id: post.id)
		like.save
		post.create_notification_like!(current_user)#通知
		redirect_to request.referer
	end

	def destroy
		post = Post.find(params[:post_id])
		like = current_user.likes.find_by(post_id: post.id)
		like.destroy
		redirect_to request.referer
	end
end
