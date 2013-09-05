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
			@lead_count = {points_total: 0,steal: 0,block: 0,rebound_total: 0 ,assist: 0}
			@lead_list = {points_total_id: 0, steal_id: 0,block_id: 0,rebound_total_id: 0,assist_id: 0}
			@lead_user_list = {points_total_id: 0, steal_id: 0,block_id: 0,rebound_total_id: 0,assist_id: 0}

			@lead = Player.where(:team_id => @init).all
			@lead.each do |y|
				@count = Record.count(:id,:conditions => ["player_id =?",y.id])
				@player_box_score = PlayerBoxScore.where(:player_id => y.id).all
				@player_box_score.each do |x|
					if x.points_total/@count.to_f > @lead_count[:points_total]
						@lead_count[:points_total] = x.points_total/@count.to_f
						@lead_list[:points_total_id] = x.player_id
						@lead_user_list[:points_total_id] = Match.where(:team_id => @init,:player_id => @lead_list[:points_total_id]).first.user_id
					end
					if x.steal/@count.to_f > @lead_count[:steal]
						@lead_count[:steal] = x.steal/@count.to_f
						@lead_list[:steal_id] = x.player_id
						@lead_user_list[:steal_id] = Match.where(:team_id => @init,:player_id => @lead_list[:steal_id]).first.user_id
					end
					if x.block/@count.to_f > @lead_count[:block]
						@lead_count[:block] = x.block/@count.to_f
						@lead_list[:block_id] = x.player_id
						@lead_user_list[:block_id] = Match.where(:team_id => @init,:player_id => @lead_list[:block_id]).first.user_id
					end
					if x.assist/@count.to_f > @lead_count[:assist]
						@lead_count[:assist] = x.assist/@count.to_f
						@lead_list[:assist_id] = x.player_id
						@lead_user_list[:assist_id] = Match.where(:team_id => @init,:player_id => @lead_list[:assist_id]).first.user_id
					end
					if x.rebound_total/@count.to_f > @lead_count[:rebound_total]
						@lead_count[:rebound_total] = x.rebound_total/@count.to_f
						@lead_list[:rebound_total_id] = x.player_id
						@lead_user_list[:rebound_total_id] = Match.where(:team_id => @init,:player_id => @lead_list[:rebound_total_id]).first.user_id
					end
				end
			end
			 if @lead_user_list[:points_total_id] == 0 
				   @image_tag = "/uploads/team_user/avatar/HeadIcon.jpg"
			 else 
				   @userIag=TeamUser.find(@lead_user_list[:points_total_id])
				   if @userIag.avatar.url.blank?
						@image_tag = "/uploads/team_user/avatar/HeadIcon.jpg" 
				   else
						@image_tag = "#{@userIag}.avatar.url"
				   end
			 end
			 if Player.find(@lead_list[:points_total_id]).name == nil 
			 	@lead_name = ""
			 else
			 	@lead_name = Player.find(@lead_list[:points_total_id]).name
			 end

			@games = Game.where(:h_team_id => @init).order("date_time DESC").limit(5)
			@players = Player.where(:team_id => @init).limit(5)
			@team = Team.all
			@matches = Match.where(:user_id => current_team_user.id)
		end


	end

	def show

	end
end


