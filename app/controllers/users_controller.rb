class UsersController < ApplicationController
  before_action :initialize_contact, only: [:show, :edit]

	def show
		@user = User.find(params[:id])
		@posts = Post.where(user_id: @user.id)
		@matches = Match.where(user_id: @user.id)

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
