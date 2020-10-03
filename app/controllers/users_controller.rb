class UsersController < ApplicationController
  before_action :authenticate_user!
  include EnsureCorrectObjects
  before_action :ensure_correct_user, only: %i[edit update]

  def show
    @user = User.find(params[:id])
    @posts = Post.where(user_id: @user.id).recent.page(params[:page]).per(4)
    @matches = Match.where(user_id: @user.id).recent.page(params[:page]).per(4)
    @room = current_user.rooms.find_by(guest_id: @user.id)
    @room ||= @user.rooms.find_by(guest_id: current_user.id)
    # 通知
    @notifications = current_user.passive_notifications.page(params[:page]).per(4)
    @notifications.where(checked: false).each do |notification|
      notification.update_attributes(checked: true)
    end
  end

  def index
    @users = User.page(params[:page]).per(8).order(current_sign_in_at: 'DESC')
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = 'User has been updated'
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
