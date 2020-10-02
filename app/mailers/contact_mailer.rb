class ContactMailer < ApplicationMailer
   DEFAULTS_TO = 'info@ajackus.com'

	def notify_contact_creation(contact)
    @user = contact
    mail(to: DEFAULTS_TO, subject: 'New Contact Has Been Created')
  end
end
