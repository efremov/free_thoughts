class CreateAgreeQuastions < ActiveRecord::Migration
  def change
    create_table :agree_quastions do |t|
      t.references :quastion
      t.integer :user_id
      
      
      t.timestamps
    end
    add_index :agree_quastions, :quastion_id
  end
end
