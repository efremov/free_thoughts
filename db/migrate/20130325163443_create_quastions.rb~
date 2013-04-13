class CreateQuastions < ActiveRecord::Migration
  def change
    create_table :quastions do |t|
      t.string :discription, :null => false
      t.string :topic, :null => false
      t.integer :rate, :default => 110
      t.string :image, :null => false
      t.references :user
      t.boolean :pass, :default => false

      t.timestamps
    end
    add_index :quastions, :user_id
  end
end
