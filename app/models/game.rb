class Game < ActiveRecord::Base

  attr_accessible :g_team_id, :h_team_id, :league_id , :name , :h_team_points ,:g_team_points,:date_time,:location,:note

  validates_presence_of :league_id
end
