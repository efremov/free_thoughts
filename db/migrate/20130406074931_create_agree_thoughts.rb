class CreateAgreeThoughts < ActiveRecord::Migration
  def change
    create_table :agree_thoughts do |t|
      t.references :thought
      t.integer :user_id
      
      t.timestamps
    end
    add_index :agree_thoughts, :thought_id
  end
end
