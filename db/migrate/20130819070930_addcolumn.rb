class Addcolumn < ActiveRecord::Migration
  def change
  	add_column :records, :two_points_made, :integer
  	add_column :records, :two_points_miss, :integer
  end
  def up
  end

  def down
  end
end
