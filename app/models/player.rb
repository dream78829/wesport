class Player < ActiveRecord::Base
  attr_accessible :name, :number, :team_id
end
