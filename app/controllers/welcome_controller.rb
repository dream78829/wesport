class WelcomeController < ApplicationController
	before_filter :authenticate_team_user!, except: [:index]

	def index
		@games = Game.limit(5).order("date_time DESC").all
		@team = Team.limit(5).all
	end

	def teamInfo
		if params[:tid]
			if Team.where(:id=> params[:tid]).blank?
				redirect_to root_path				
			else
				@team = Team.find(params[:tid])
				@games = Game.where(:h_team_id =>@team.id).limit(5).order("date_time DESC")
				@players = Player.where(:team_id =>@team.id).all
				@match = Match.where(:team_id =>@team.id,:status=>3).first
				@captian = Player.find(@match.player_id)
			end
		else
			redirect_to root_path
		end
	end
end
