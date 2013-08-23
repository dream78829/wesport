class AddcolumntogameIi < ActiveRecord::Migration
	def change
  	add_column :games, :date_time , :datetime
  end
  def up
  end

  def down
  end
end
