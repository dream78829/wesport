class Addcolumntogame < ActiveRecord::Migration
  def change
  	add_column :games, :h_team_points , :integer
  	add_column :games, :g_team_points , :integer
  end
  def up
  end

  def down
  end
end
