class UsersController < ApplicationController
  before_action :initialize_contact, only: [:show, :edit]

	def show
		@user = User.find(params[:id])
		@posts = Post.where(user_id: @user.id).page(params[:page]).per(4)
		@matches = Match.where(user_id: @user.id).page(params[:page]).per(4)
		# DM機能
		@currentUserEntry = Entry.where(user_id: current_user.id)
		@userEntry = Entry.where(user_id: @user.id)
		unless @user.id == current_user.id
			@currentUserEntry.each do |cu|
				@userEntry.each do |u|
					if cu.room_id == u.room_id then
						@isRoom = true
						@roomId = cu.room_id
					end
				end
			end

			if @isRoom
			else
				@room = Room.new
				@entry = Entry.new
			end
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
		@user.update(user_params)
		redirect_to user_path(@user),notice: "User has been updated"
	end

	private
	def user_params
		params.require(:user).permit(:profile, :image, :name)
	end
end
