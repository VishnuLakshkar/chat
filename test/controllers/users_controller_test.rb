require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
	include Devise::Test::IntegrationHelpers
  def setup
  	@user = users(:vishnu)
  end

  test "user should login" do 
  	sign_in users(:vishnu)
  	get root_path
  	assert_response :success

  	assert_select "a[href=?]", users_path
  	assert_select "a[href=?]", destroy_user_session_path
  	assert_select "a[href=?]", home_index_path
  	assert_select "a[href=?]", edit_user_registration_path
  	assert_select "a[href=?]", block_list_user_path(@user.id)
  	assert_select "a[href=?]", new_user_session_path, count: 0
  end

  test "user should redirect to sign in if not logged in" do 
  	get users_path
  	assert_redirected_to new_user_session_path
  	assert_select "a[href=?]", destroy_user_session_path, count: 0
  	assert_select "a[href=?]", users_path, count: 0
  	assert_select "a[href=?]", destroy_user_session_path, count: 0
  	assert_select "a[href=?]", home_index_path, count: 0
  	assert_select "a[href=?]", edit_user_registration_path, count: 0
  	assert_select "a[href=?]", block_list_user_path(@user.id), count: 0
	end

	test "user should redirect to users path when log in" do 
  	sign_in users(:vishnu)
		get users_path
		assert_response :success
    collection = users.reject{|u| u == users(:vishnu)}
    collection.each do |u|
      if !(@user.is_blocked?(u) || u.is_blocked?(@user))
        assert_select "a[href=?]", user_path(u)
      end
    end
	end

	test "user should redirect to edit" do 
  	sign_in users(:vishnu)
		get edit_user_registration_path
		assert_response :success

		assert_select "label", "Password"
		assert_select "h3", "Cancel my account"
	end

  test "user cannot update information without login" do
    get edit_user_registration_path
    assert_redirected_to new_user_session_path
    follow_redirect!
    assert_response :success
  end

  test "user should get block list" do 
    sign_in users(:vishnu)
    get block_list_user_path(@user.id)
    
    @user.blockers.each do |blocked_user|
      assert_select "a[href=?]", blocked_user.email
    end    
  end
end
