class TeamUsersController < ApplicationController
	before_filter :authenticate_team_user!, except: [:show]
	def index
		@init = params[:id]
		@test = Match.where(:user_id => current_team_user.id).first
		if !@init
			if @test == nil
				redirect_to new_team_path
			else
				@init =  Match.where(:user_id => current_team_user.id).first.id
			end
		end
		

		@games = Game.where(:h_team_id => @init).limit(10)
		@players = Player.where(:team_id => @init).all
		@team = Team.all
		@matches = Match.where(:user_id => current_team_user.id)
	end
	def show

	end
end
