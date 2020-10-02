class Api::V1::ContactsController < ApplicationController
	skip_before_action :verify_authenticity_token

	def create
		contact = Contact.new(sanitized_params)
		if contact.save
			ContactMailer.notify_contact_creation(contact).deliver
			render json: { message: 'successfully created contact'}, status: 200
		else
			render json: { message: contact.errors.full_messages.join(',') }, status: 400
		end
	end

	private
	
  def sanitized_params
  	params.permit(:first_name, :last_name, :phone, :email, :message)
  end
end
