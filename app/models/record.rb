class Record < ActiveRecord::Base
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
  attr_accessible :assist, :block, :defensive_rebound, :efficiency_formula, :free_throw_made, :free_throw_miss, :free_throw_total, :game_id, :offensive_rebound, :personal_foul, :player_id, :points_total, :rebound_total, :steal, :three_points_made, :three_points_miss, :three_points_total, :turn_over, :two_points_made, :two_points_miss, :two_points_total,:starter
  validates_presence_of :assist, :block, :defensive_rebound, :free_throw_made, :free_throw_miss, :free_throw_total, :game_id, :offensive_rebound, :personal_foul, :player_id, :rebound_total, :steal, :three_points_made, :three_points_miss, :three_points_total, :turn_over, :two_points_made, :two_points_miss, :two_points_total
  
=======
>>>>>>> 6b5bfd64287f5055df97c73415b15f80a16a5658
=======
>>>>>>> Eric


  attr_accessible :assist, :block, :defensive_rebound, :efficiency_formula, :free_throw_made, :free_throw_miss, :free_throw_total, :game_id, :offensive_rebound, :personal_foul, :player_id, :points_total, :rebound_total, :steal, :three_points_made, :three_points_miss, :three_points_total, :turn_over, :two_points_made, :two_points_made, :two_points_total
  
  after_initialize :set_defaults
  private
  def set_defaults
    

  end 
<<<<<<< HEAD
<<<<<<< HEAD
=======
  attr_accessible :assist, :block, :defensive_rebound, :efficiency_formula, :free_throw_made, :free_throw_miss, :free_throw_total, :game_id, :offensive_rebound, :personal_foul, :player_id, :points_total, :rebound_total, :steal, :three_points_made, :three_points_miss, :three_points_total, :turn_over, :two_points_made, :two_points_miss, :two_points_total,:starter
  validates_presence_of :assist, :block, :defensive_rebound, :free_throw_made, :free_throw_miss, :free_throw_total, :game_id, :offensive_rebound, :personal_foul, :player_id, :rebound_total, :steal, :three_points_made, :three_points_miss, :three_points_total, :turn_over, :two_points_made, :two_points_miss, :two_points_total
  
>>>>>>> Andy
=======
>>>>>>> 013ead48a708798887f8935474e7836ac2b26591
>>>>>>> 6b5bfd64287f5055df97c73415b15f80a16a5658
=======

  attr_accessible :assist, :block, :defensive_rebound, :efficiency_formula, :free_throw_made, :free_throw_miss, :free_throw_total, :game_id, :offensive_rebound, :personal_foul, :player_id, :points_total, :rebound_total, :steal, :three_points_made, :three_points_miss, :three_points_total, :turn_over, :two_points_made, :two_points_miss, :two_points_total,:starter
  validates_presence_of :assist, :block, :defensive_rebound, :free_throw_made, :free_throw_miss, :free_throw_total, :game_id, :offensive_rebound, :personal_foul, :player_id, :rebound_total, :steal, :three_points_made, :three_points_miss, :three_points_total, :turn_over, :two_points_made, :two_points_miss, :two_points_total
  

>>>>>>> Eric
end
