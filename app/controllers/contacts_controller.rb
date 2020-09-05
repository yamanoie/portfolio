class ContactsController < ApplicationController

	def new
		@contact= Contact.new
	end

	def create
		@contact = Contact.new(contact_params)
		if @contact.save
			ContactMailer.contact_mail(@contact).deliver
			flash[:success] = "You sent an email to the admin"
			redirect_to request.referer
		else
			render :new
		end

	end

	private

	def contact_params
		params.require(:contact).permit(:name, :email, :content)
	end
end
