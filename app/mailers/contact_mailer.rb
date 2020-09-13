class ContactMailer < ApplicationMailer
  def contact_mail(contact)
    @contact = contact
    mail to: ENV['ADMIN_EMAIL_ADDRESS'], subject: 'confirmation'
  end
end
