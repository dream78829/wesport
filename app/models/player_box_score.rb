class PlayerBoxScore < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :assist, :block, :defensive_rebound, :efficiency_formula, :free_throw_made, :free_throw_miss, :free_throw_total,  :offensive_rebound, :personal_foul, :player_id, :points_total, :rebound_total, :steal, :three_points_made, :three_points_miss, :three_points_total, :turn_over, :two_points_made, :two_points_made, :two_points_total
  after_initialize :set_defaults
  private
  def set_defaults
	self.assist = 0
	self.block = 0 
	self.defensive_rebound = 0
	self.offensive_rebound = 0
	self.rebound_total = 0
	self.free_throw_made = 0
	self.free_throw_miss = 0
	self.free_throw_total = 0
	self.two_points_made = 0
	self.two_points_miss = 0
	self.two_points_total = 0
	self.three_points_made = 0
	self.three_points_miss = 0
	self.three_points_total = 0   	
	self.steal = 0
	self.personal_foul = 0
	self.turn_over = 0
	self.efficiency_formula = 0
	self.points_total = 0



  end 
end
