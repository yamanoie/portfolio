class UsersController < ApplicationController
  before_action :initialize_contact, only: [:show, :edit]
  before_action :authenticate_user!, only: [:edit]
  include EnsureCorrectObjects
  before_action :ensure_correct_user, only:[:edit, :update]

	def show
		@user = User.find(params[:id])
		@posts = Post.where(user_id: @user.id).order(created_at: "DESC").page(params[:page]).per(4)
		@matches = Match.where(user_id: @user.id).order(created_at: "DESC").page(params[:page]).per(4)
		@room = current_user.rooms.find_by(guest_id: @user.id)
		unless @room
			@room = @user.rooms.find_by(guest_id: current_user.id)
		end

	  	#通知
	  	@notifications = current_user.passive_notifications.page(params[:page]).per(4)
	  	@notifications.where(checked: false).each do |notification|
	  		notification.update_attributes(checked: true)
	  	end
	  	# binding.pry
	end

	def index
		@users = User.page(params[:page]).per(8).order(current_sign_in_at: "DESC")
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		if @user.update(user_params)
			flash[:success] = "User has been updated"
			redirect_to user_path(@user)
		else
			render :edit
		end
	end

	private
	def user_params
		params.require(:user).permit(:profile, :image, :name)
	end
end
