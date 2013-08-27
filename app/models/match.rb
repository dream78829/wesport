class Match < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :player_id, :status, :team_id, :state,:user_id
  validates_presence_of :status, :team_id, :state,:user_id
end
