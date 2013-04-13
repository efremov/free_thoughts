class AddDefaultValueeeToQuastions < ActiveRecord::Migration
  def change
     change_column :thoughts, :user_id, :integer, :default => 5
  end
end
