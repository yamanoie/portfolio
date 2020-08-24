class ContactsController < ApplicationController
	def create
		@contact = Contact.new(contact_params)
		if @contact.save
			ContactMiler.contact_mail(@contact).deliver
			redirect_to request.refere
		end
	end

	private

	def contact_params
		params.require(:contact).permit(:name, :email, :content)
	end
end
