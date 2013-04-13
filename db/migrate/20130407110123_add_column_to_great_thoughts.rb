class AddColumnToGreatThoughts < ActiveRecord::Migration
  def change
    add_column :great_thoughts, :been, :boolean, :default => false
  end
end
