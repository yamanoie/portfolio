class Post < ApplicationRecord
	belongs_to :user
	has_many :notifications, dependent: :destroy
	has_many :likes, dependent: :destroy
	has_many :comments, dependent: :destroy
	attachment :image

	validates :text, presence: true
	validates :text, length: { maximum: 141 }

	def liked_by?(user)
		likes.where(user_id: user.id).exists?
	end

	def create_notification_like(current_user)
		temp = Notificaiton.where(["visitor_id = ? and visited_id = ? and post_id = ? action = ? ", current_user.id, user_id, id , "like"])
		if temp.blank?
			notification = current_user.active_notifications.new(
				post_id: id,
				visited_id: user_id,
				action: "like"
				)
			if notification.visitor_id == notification.visited_id
				notification.checked = true
			end
			notification.save if notification.valid?
		end
	end
end
