class AddDefaultValueToQuastions < ActiveRecord::Migration
  def change
    change_column :quastions, :image, :string, :default => 'no'
  end
end
