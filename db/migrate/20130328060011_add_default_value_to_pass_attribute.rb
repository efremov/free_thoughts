class AddDefaultValueToPassAttribute < ActiveRecord::Migration
  def change
    change_column :quastions, :pass, :boolean, :default => nil
  end
end
