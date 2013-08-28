class Addcolumntoplayerboxscore < ActiveRecord::Migration
	def change
		add_column :player_box_scores,:player_id,:integer 
		add_column :player_box_scores,:free_throw_made,:integer 
		add_column :player_box_scores,:free_throw_miss,:integer
		add_column :player_box_scores,:free_throw_total,:integer 
		add_column :player_box_scores,:two_points_made,:integer
		add_column :player_box_scores,:two_points_miss,:integer
		add_column :player_box_scores,:two_points_total,:integer
		add_column :player_box_scores,:three_points_made,:integer 
		add_column :player_box_scores,:three_points_miss,:integer 
		add_column :player_box_scores,:three_points_total,:integer 
		add_column :player_box_scores,:assist,:integer 
		add_column :player_box_scores,:block,:integer 
		add_column :player_box_scores,:turn_over,:integer 
		add_column :player_box_scores,:steal,:integer 
		add_column :player_box_scores,:defensive_rebound,:integer 
		add_column :player_box_scores,:offensive_rebound,:integer 
		add_column :player_box_scores,:rebound_total,:integer 
		add_column :player_box_scores,:personal_foul,:integer 
		add_column :player_box_scores,:points_total,:integer 
		add_column :player_box_scores,:efficiency_formula,:integer
	end
  def up
  end

  def down
  end
end
