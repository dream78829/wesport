class Game < ActiveRecord::Base
<<<<<<< HEAD
  attr_accessible :g_team_id, :h_team_id, :league_id , :name , :h_team_points ,:g_team_points,:date_time 
=======
  attr_accessible :g_team_id, :h_team_id, :league_id , :name , :h_team_points ,:g_team_points,:date_time,:location,:note
>>>>>>> 013ead48a708798887f8935474e7836ac2b26591
  validates_presence_of :league_id
end
