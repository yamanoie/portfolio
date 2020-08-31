class Comment < ApplicationRecord

	has_many :notifications, dependent: :destroy
	belongs_to :user
	belongs_to :post

	validates :comment, presence: true
	validates :comment, length: { maximum: 100 }

	def create_notification_comment(current_user, comment_id)
		temp_ids = Comment.select(:user_id).where(post_id: id).where.not(user_id: current_user.id).distinct
		temp_ids.each do |temp_id|
			save_notification_comment(current_user, comment_id, temp_id["user_id"])
		end
		save_notification_comment(current_user, comment_id, user_id) if temp_ids.blank?
	end

	def save_notification_comment(current_user, comment_id, visited_id)
		notification = current_user.active_notification.new(
			post_id: id,
			comment_id: comment_id,
			visited_id: visited_id,
			action: "comment"
			)
		if notification.vistor_id == notification.visited_id
			notification.checked = true
		end
		notification.save if notification.valid?
	end



end
