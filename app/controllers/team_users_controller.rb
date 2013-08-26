class TeamUsersController < ApplicationController
	before_filter :authenticate_team_user!, except: [:show]
	def index
		@init = params[:id]
		if !@init
			@init =  Match.where(:user_id => current_team_user.id).first.id
		end
		

		@games = Game.where(:h_team_id => @init).limit(10)
		@players = Player.where(:team_id => @init).all
		@team = Team.all
		@matches = Match.where(:user_id => current_team_user.id)
	end
	def show

	end
end
