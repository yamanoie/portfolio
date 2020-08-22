class UsersController < ApplicationController

	def show
		@post = Post.find_by(id: params[:id])
		@user = User.find_by(id: @post.user_id)
		@posts = Post.where(user_id: @user.id)

	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		@user.update(user_params)
		redirect_to user_path(@user)
	end

	private
	def user_params
		params.require(:user).permit(:profile, :image, :name)
	end
end
