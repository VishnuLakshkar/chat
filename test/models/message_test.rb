require 'test_helper'

class MessageTest < ActiveSupport::TestCase
  def setup
  	@message = Message.create(body: "hello", conversation_id: conversations(:one).id, user_id: users(:anshul).id)
  end

  test "valid" do 
  	assert @message.valid?
  end

  test "message cannot be blank" do  
  	@message.body = "  " * 5
  	assert_not @message.valid?
  end
  
  test "user id cannot nil" do 
  	@message.user_id = nil
  	assert_not @message.valid?
  end
end
