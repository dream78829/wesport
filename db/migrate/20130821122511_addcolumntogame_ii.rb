class AddcolumntogameIi < ActiveRecord::Migration
  def change
  	add_column :games, :date_time , :datetime
  end
end
