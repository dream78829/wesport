class Team < ActiveRecord::Base
  attr_accessible :code, :name
  validates_presence_of :name,:code
end
