class Changecolumn < ActiveRecord::Migration
  def change
  	rename_column :records, :two_points_made, :two_points_miss
  	remove_column :records, :two_points_miss
  end
  def up
  end

  def down
  end
end
