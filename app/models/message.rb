class Message < ApplicationRecord
	has_many :notifications, dependent: :destroy
	belongs_to :user
	belongs_to :room

	validates :message, presence: true

	def save_notification_message!(current_user,message_id,visited_id)
		notification = current_user.active_notification.new(
			message_id: message_id,
			visited_id: visited_id,
			action: "message"
			)
		notification.save if notification.valid?
	end

	# from  = Time.current.at_beginning_of_day
	# to    = (from + 3.day).at_end_of_day
	# new_message = Messaege.where(user_id: currnt_user.id).where(created_at: from...to)

end
