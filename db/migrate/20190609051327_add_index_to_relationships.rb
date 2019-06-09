class AddIndexToRelationships < ActiveRecord::Migration[5.2]
  def change
    add_index :relationships, :blocked_id
    add_index :relationships, :blocker_id
  end
end
