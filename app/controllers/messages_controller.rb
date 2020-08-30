class MessagesController < ApplicationController

	def create
		if Entry.where(:user_id => current_user.id, :room_id => params[:message][:room_id]).present?
			@message = Message.create(params.require(:message).permit(:user_id, :message, :room_id).merge(:user_id => current_user.id)),notice: "Message has been sent"
			redirect_to "/rooms/#{@message.room_id}"
		else
			redirect_back(fallback_location: posts_path)
		end
	end

	def destroy
		message = Message.find(params[:id])
		message.destroy
		redirect_to request.referer
	end

end
