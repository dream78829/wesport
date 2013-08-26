class AddcolumntomatchIi < ActiveRecord::Migration
   def change
  	add_column :user_team_matches,:user_id,:integer
  	add_column :user_team_matches ,:team_id,:integer
  	add_column :user_team_matches ,:player_id,:integer
  	add_column :user_team_matches ,:status,:integer
  end
  def up
  end

  def down
  end
end
