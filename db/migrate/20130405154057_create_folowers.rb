class CreateFolowers < ActiveRecord::Migration
  def change
    create_table :folowers do |t|
      t.references :user
      t.integer :thinker_id

      t.timestamps
    end
  add_index :folowers, :user_id
  end
end
