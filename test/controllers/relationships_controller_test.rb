require 'test_helper'

class RelationshipsControllerTest < ActionDispatch::IntegrationTest
  test "user cannot block user without log in" do
  	assert_no_difference 'Relationship.count' do 
  		post relationships_path
  	end
  	assert_redirected_to new_user_session_path
	end

	test "user cannot unblock user without log in" do 
		assert_no_difference 'Relationship.count' do 
			delete relationship_path(relationships(:one))
		end
		assert_redirected_to new_user_session_path
	end
end
