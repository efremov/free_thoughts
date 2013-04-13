class CreatePersonalInfos < ActiveRecord::Migration
  def change
    create_table :personal_infos do |t|
      t.string :name
      t.string :surname
      t.string :gender
      t.integer :age
      t.string :image
      t.string :country
      t.string :marital_status
      t.string :credo
      t.string :religion
      t.string :political_views
      t.string :smf_more
      t.references :user
      
      t.timestamps
    end
    add_index :personal_infos, :user_id
  end
end
