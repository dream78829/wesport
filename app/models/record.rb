class Record < ActiveRecord::Base
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> Eric


  attr_accessible :assist, :block, :defensive_rebound, :efficiency_formula, :free_throw_made, :free_throw_miss, :free_throw_total, :game_id, :offensive_rebound, :personal_foul, :player_id, :points_total, :rebound_total, :steal, :three_points_made, :three_points_miss, :three_points_total, :turn_over, :two_points_made, :two_points_made, :two_points_total
  validates_numericality_of :assist, :block, :defensive_rebound, :free_throw_made, :free_throw_miss, :offensive_rebound, :personal_foul, :steal, :three_points_made, :three_points_miss, :turn_over, :two_points_made, :two_points_made,:greater_than => -1,:less_than=>100#, :only_integer => true 
  after_initialize :set_defaults
  private
  def set_defaults
    

  end 
<<<<<<< HEAD

  attr_accessible :assist, :block, :defensive_rebound, :efficiency_formula, :free_throw_made, :free_throw_miss, :free_throw_total, :game_id, :offensive_rebound, :personal_foul, :player_id, :points_total, :rebound_total, :steal, :three_points_made, :three_points_miss, :three_points_total, :turn_over, :two_points_made, :two_points_miss, :two_points_total,:starter
  validates_presence_of :assist, :block, :defensive_rebound, :free_throw_made, :free_throw_miss, :free_throw_total, :game_id, :offensive_rebound, :personal_foul, :player_id, :rebound_total, :steal, :three_points_made, :three_points_miss, :three_points_total, :turn_over, :two_points_made, :two_points_miss, :two_points_total
  

=======
  attr_accessible :assist, :block, :defensive_rebound, :efficiency_formula, :free_throw_made, :free_throw_miss, :free_throw_total, :game_id, :offensive_rebound, :personal_foul, :player_id, :points_total, :rebound_total, :steal, :three_points_made, :three_points_miss, :three_points_total, :turn_over, :two_points_made, :two_points_miss, :two_points_total,:starter
  validates_presence_of :player_id 
  
>>>>>>> 2ae54e6475e1d430890d561a949caff189bf135e
=======

  attr_accessible :assist, :block, :defensive_rebound, :efficiency_formula, :free_throw_made, :free_throw_miss, :free_throw_total, :game_id, :offensive_rebound, :personal_foul, :player_id, :points_total, :rebound_total, :steal, :three_points_made, :three_points_miss, :three_points_total, :turn_over, :two_points_made, :two_points_miss, :two_points_total,:starter
  validates_presence_of :assist, :block, :defensive_rebound, :free_throw_made, :free_throw_miss, :free_throw_total, :game_id, :offensive_rebound, :personal_foul, :player_id, :rebound_total, :steal, :three_points_made, :three_points_miss, :three_points_total, :turn_over, :two_points_made, :two_points_miss, :two_points_total
  

>>>>>>> Eric
end
