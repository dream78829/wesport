class TeamUsersController < ApplicationController
	before_filter :authenticate_team_user!
	def index
		@games = Game.where(:h_team_id => current_team_user.id).all
		@players = Player.where(:team_id => current_team_user.id).all
	end
	def show
	end
end
