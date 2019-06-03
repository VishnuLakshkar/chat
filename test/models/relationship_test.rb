require 'test_helper'

class RelationshipTest < ActiveSupport::TestCase
  def setup
  	@relationship = Relationship.create(blocker_id: users(:vishnu).id, blocked_id: users(:shipra).id)
  end

  test "valid relationship" do
  	assert @relationship.valid?
  end

  test "blocker id must present" do 
  	@relationship.blocker_id = nil
  	assert_not @relationship.valid?
  end

  test "blocked id must present" do 
  	@relationship.blocked_id = nil
  	assert_not @relationship.valid?
  end
end
