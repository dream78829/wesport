class Game < ActiveRecord::Base
  attr_accessible :g_team_id, :h_team_id, :league_id , :name
end
