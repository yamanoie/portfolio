class ContactMailer < ApplicationMailer
  def contact_mail(contact)
    @contact = contact
    mail to: 'yamanoie1028@gmail.com', subject: 'confirmation'
  end
end
