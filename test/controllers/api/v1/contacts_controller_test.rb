require 'test_helper'

class Api::V1::ContactsControllerTest < ActionController::TestCase

	test "should create contacts through ajax request" do
		params = { 
			first_name: "sample_name", 
			last_name: "sample_last_name", 
			email: 'test@domain.com',
			phone: '5555555555',
			message: "sample data" 
		}
		post :create, params: params, xhr: true
	  
	  assert_equal 200, @response.status  
	  assert_equal "application/json", @response.media_type
	end
end
