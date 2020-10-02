require 'test_helper'

class ContactTest < ActiveSupport::TestCase

  test "should not save contact without required_fields" do
	  article = Contact.new
	  assert_not article.save
	end

  test "is valid with no phone number for a contact " do
    contact =  Contact.new(
    							first_name: 'test_first_name',
    							last_name: 'test_last_name',
    				      message: 'sample text',
                  :email => 'test@domain.com',
                 )
    assert contact.phone.nil?
  end
end
