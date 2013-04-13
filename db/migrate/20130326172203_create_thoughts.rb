class CreateThoughts < ActiveRecord::Migration
  def change
    create_table :thoughts do |t|
      t.references :user
      t.references :quastion
      t.integer :rate, :default => 0
      t.string :point, :null => false

      t.timestamps
    end
    add_index :thoughts, :user_id
    add_index :thoughts, :quastion_id
  end
end
