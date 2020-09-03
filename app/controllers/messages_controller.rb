class MessagesController < ApplicationController

	def create
		@message = Message.create(params.require(:message).permit(:message, :room_id).merge(user_id: current_user.id))
		@message.create_notification_message!(current_user,@message.id,params[:message][:visited_id])#通知
		# redirect_to "/rooms/#{@message.room_id}"
		@room = Room.find(@message.room_id)
		@messages = @room.messages.includes(:user).order(created_at: "DESC").page(params[:page]).per(8)
		flash[:notice] = "Message has been sent"
	end

	def destroy
		@message = Message.find(params[:id])
		@message.destroy
		# redirect_to request.referer
		@room = Room.find(@message.room_id)
		@messages = @room.messages.includes(:user).order(created_at: "DESC").page(params[:page]).per(8)
		flash[:notice] = "Message has been deleted"
	end

end
