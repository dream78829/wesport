class WelcomeController < ApplicationController
	before_filter :authenticate_team_user!, except: [:index]

	def index
		
	end
end
