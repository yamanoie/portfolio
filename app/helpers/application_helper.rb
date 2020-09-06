module ApplicationHelper
	def create_time_with_country(user, model)
		created_at = user.country.present? ? (model.created_at - 1.hour) : model.created_at
		return created_at.strftime("%Y-%m-%d %H:%M")
	end
end