# encoding: utf-8
class TeamUsersController < ApplicationController
	before_filter :authenticate_team_user!,:except=>[:show]
	def index
		@init = params[:tid]


		#判斷user是否有存取該team的權限（有team_id,user_id,state = 1）
		@status = Match.where(["team_id = ? and user_id = ? and state = ?", params[:tid],current_team_user.id,1]).last
		if @status != nil
				@init=params[:tid]
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
			if Match.where(:user_id => current_team_user.id,:team_id =>@init,:state =>1).first != nil
				@statusLevel = Match.where(:user_id => current_team_user.id,:team_id =>@init,:state =>1).first.status
			end
			@confirmNum = Match.count(:id,:conditions => ["team_id = ? and state =?",@init,0])
		end


	end
	def show
	end

	def IDconfirm
		@matches = Match.where(:team_id=>params[:tid])
	end
	
	def edit
    	@user = TeamUser.find(current_team_user.id)
  	end
 	def update
    	@user = TeamUser.find(current_team_user.id)
		respond_to do |format| 
		 	if @user.update_attributes(params[:user]) 
		 		format.html { redirect_to @user, notice: 'User was successfully updated.' }
		 		format.json { head :no_content } 
		 	else 
			 	format.html { render action: "edit" } 
			 	format.json { render json: @luser.errors, status: :unprocessable_entity } 
		 	end 
 		end
 	end
end
