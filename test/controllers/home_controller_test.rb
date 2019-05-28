require 'test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest
  def setup
  	@user = users(:vishnu)
  end

  test "should redirect to sign in when not login" do
    get home_index_path
    assert_redirected_to new_user_session_path 
  end

  test "should get sign up path" do
  	get new_user_registration_path
  	assert_response :success

  	assert_select "a[href=?]", new_user_session_path
  	assert_select "a[href=?]", new_user_registration_path
	end

	test "should get sign in path" do
		get new_user_session_path
		assert_response :success

		assert_select "a[href=?]", new_user_session_path
  	assert_select "a[href=?]", new_user_registration_path
	end
end