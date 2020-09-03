class ApplicationController < ActionController::Base

	before_action :configure_permitted_parameters, if: :devise_controller?
	protected
	def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up, keys: [:name,:country])
	end

	def after_sign_in_path_for(resource)
		case resource
		when User
    		posts_path
    	when AdminUser
			stored_location_for(resource) ||
		     if resource.is_a?(AdminUser)
		       root_path
		     else
		       super
		     end
      	end
	end

	def after_sign_up_path_for(resource)
    	posts_path data: {"turbolinks" => false}
	end

	def initialize_contact
		@contact = Contact.new
	end


end
