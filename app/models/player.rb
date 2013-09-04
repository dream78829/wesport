class Player < ActiveRecord::Base
  attr_accessible :name, :number, :team_id
  validates_numericality_of :number,:greater_than => -1,:less_than=>100
  validates_presence_of :name, :number, :team_id
end
