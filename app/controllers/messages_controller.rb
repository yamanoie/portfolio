class MessagesController < ApplicationController
  def create
    @message = Message.new(params.require(:message).permit(:message, :room_id).merge(user_id: current_user.id))
    if @message.save
      @message.create_notification_message!(current_user, @message.id, params[:message][:visited_id]) # 通知
      @room = Room.find(@message.room_id)
      @messages = @room.messages.includes(:user).order(created_at: 'DESC').page(params[:page]).per(8)
      flash.now[:success] = 'Message has been sent '
    end
  end

  def destroy
    @message = Message.find(params[:id])
    @message.destroy
    @room = Room.find(@message.room_id)
    @messages = @room.messages.includes(:user).order(created_at: 'DESC').page(params[:page]).per(8)
    flash.now[:danger] = 'Message has been deleted'
  end
end
