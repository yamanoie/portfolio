class RoomsController < ApplicationController

	def create
		@room = Room.create(params.require(:room).permit(:guest_id).merge(:user_id => current_user.id))
		# @entry1 = Entry.create(room_id: @room.id, user_id: current_user.id)
		# @entry2 = Entry.create(params.require(:entry).permit(:user_id, :room_id).merge(:room_id => @room.id))
		redirect_to "/rooms/#{@room.id}"
	end

	def show
		@room = Room.find(params[:id])
		@messages = @room.messages.includes(:user).order(created_at: "DESC").page(params[:page]).per(8)
		@message = Message.new
		# @entries = @room.entries.includes(:user)
	end
end
