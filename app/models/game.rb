class Game < ActiveRecord::Base
<<<<<<< HEAD
<<<<<<< HEAD

  attr_accessible :g_team_id, :h_team_id, :league_id , :name , :h_team_points ,:g_team_points,:date_time,:location,:note

=======
<<<<<<< HEAD
<<<<<<< HEAD
  attr_accessible :g_team_id, :h_team_id, :league_id , :name , :h_team_points ,:g_team_points,:date_time 
=======
  attr_accessible :g_team_id, :h_team_id, :league_id , :name , :h_team_points ,:g_team_points,:date_time,:location,:note
>>>>>>> 013ead48a708798887f8935474e7836ac2b26591
=======
  attr_accessible :g_team_id, :h_team_id, :league_id , :name , :h_team_points ,:g_team_points,:date_time ,:note,:location
>>>>>>> Andy
>>>>>>> 6b5bfd64287f5055df97c73415b15f80a16a5658
=======


  attr_accessible :g_team_id, :h_team_id, :league_id , :name , :h_team_points ,:g_team_points,:date_time,:location,:note


>>>>>>> Eric
  validates_presence_of :league_id
end
