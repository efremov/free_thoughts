class AddColumnToUser < ActiveRecord::Migration
  def change
    add_column :users, :rate, :integer, :default => 100
  end
end
