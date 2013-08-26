class TeamUsersController < ApplicationController
	before_filter :authenticate_team_user!, except: [:show]
	def index
		#判斷user是否有存取該team的權限，state = 1
		@status = Match.where(["team_id = ? and user_id = ? and state = ?", params[:id],current_team_user.id,1]).last
		if @status
				@init=params[:id]
		end

		#若沒有權限，或是沒有team_id，則以第一筆team資料為
		if !@init
			@init =  Match.where(:user_id => current_team_user.id).first.id
		end

		if @init
			@games = Game.where(:h_team_id => @init).limit(10)
			@players = Player.where(:team_id => @init).all
			@team = Team.all
			@matches = Match.where(:user_id => current_team_user.id)
		else
			redirect_to :controller =>"welcome",:action=>"index"
		end
	end

	def show

	end
end
