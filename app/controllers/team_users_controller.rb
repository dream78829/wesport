class TeamUsersController < ApplicationController
	before_filter :authenticate_team_user!, except: [:show]
	def index
		@games = Game.where(:h_team_id => current_team_user.id).limit(10)
		@players = Player.where(:team_id => current_team_user.id).all
	end
	def show

	end
end
