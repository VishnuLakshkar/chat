require 'test_helper'

class ConversationTest < ActiveSupport::TestCase
  def setup
  	@conversation = Conversation.create(sender_id: users(:vishnu).id, recipient_id: users(:shipra).id)
  end

  test "valid" do 
  	assert @conversation.valid?
  end

  test "sender id can not be empty" do 
  	@conversation.sender_id = nil
  	assert_not @conversation.valid?
  end
	
	test "recipient id can not be empty" do 
  	@conversation.recipient_id = nil
  	assert_not @conversation.valid?
  end
  
  test "can not take multiple cnoversations with same ids" do 
  	duplicate_conversation = @conversation.dup
  	assert_not duplicate_conversation.valid?
  end
end
