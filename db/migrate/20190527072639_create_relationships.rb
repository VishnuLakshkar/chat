class CreateRelationships < ActiveRecord::Migration[5.2]
  def change
    create_table :relationships do |t|
    	t.integer :blocked_id
      t.integer :blocker_id
      
      t.timestamps
    end
  end
end
