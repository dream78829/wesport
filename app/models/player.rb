class Player < ActiveRecord::Base
  attr_accessible :name, :number, :team_id
<<<<<<< HEAD
  validates_presence_of :name, :number, :team_id
=======
  validates_presence_of :team_id
>>>>>>> Eric
end
