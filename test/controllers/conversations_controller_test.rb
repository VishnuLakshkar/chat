require 'test_helper'

class ConversationControllerTest < ActionDispatch::IntegrationTest
	test "user cannot create any conversation without login" do 
		assert_no_difference 'Conversation.count' do 
			post conversations_path
		end
		assert_redirected_to new_user_session_path
	end
end