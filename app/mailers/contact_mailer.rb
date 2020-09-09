class ContactMailer < ApplicationMailer
  def contact_mail(contact)
    @contact = contact
    mail to: 'yamanoieyamanoie@yahoo.co.jp', subject: 'confirmation'
  end
end
