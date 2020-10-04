class RoomsController < ApplicationController
  before_action :authenticate_user!
  include EnsureCorrectUser
  before_action :ensure_correct_room, only: [:show]

  def create
    if @room = Room.create(params.require(:room).permit(:guest_id).merge(user_id: current_user.id))
      redirect_to room_path(@room.id)

    else
      render :show
    end
  end

  def show
    @room = Room.find(params[:id])
    @messages = @room.messages.includes(:user).recent.page(params[:page]).per(8)
    @message = Message.new
  end
end
