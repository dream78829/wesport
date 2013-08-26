class Dropcolumn < ActiveRecord::Migration
	def change
  	
  	remove_column :records, :two_points_miss
  end
  def up
  end

  def down
  end
end
