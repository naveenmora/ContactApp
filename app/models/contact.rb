class Contact < ApplicationRecord 
	validates :first_name, :presence => { message: 'First Name cannot be blank' }
	validates :last_name, :presence => { message: 'Last Name cannot be blank' }
	validates :email, presence: true
	validates :message, :presence => { message: 'message cannot be blank' }
end
