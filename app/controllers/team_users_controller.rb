class TeamUsersController < ApplicationController
	before_filter :authenticate_team_user!, except: [:show]
	def index
		@init = params[:id]

		#判斷user是否有存取該team的權限（有team_id,user_id,state = 1）
		@status = Match.where(["team_id = ? and user_id = ? and state = ?", params[:id],current_team_user.id,1]).last
		if @status != nil
				@init=params[:id]
		end

		#若沒有權限，或是沒有team_id。則default為第一筆team資料，若沒資料則倒回新增隊伍
		if !@init
			@test = Match.where(:user_id => current_team_user.id).first
			if @test == nil
				redirect_to new_team_path
			else
				@init =  Match.where(:user_id => current_team_user.id).first.team_id
			end
		end


		if @init
			@games = Game.where(:h_team_id => @init).order("date_time DESC").limit(5)
			@players = Player.where(:team_id => @init).limit(5)
			@team = Team.all
			@matches = Match.where(:user_id => current_team_user.id)
		end

	end

	def show

	end
end
