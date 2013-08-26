class WelcomeController < ApplicationController
	before_filter :authenticate_team_user!, except: [:index]

	def index
		@games = Game.limit(5).order("date_time DESC").all
		@team = Team.limit(5).all
	end
end
