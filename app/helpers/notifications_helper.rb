module NotificationsHelper
	def exist_unchecked_notifications
		current_user.passive_notifications.where(checked: false).any?
	end
end