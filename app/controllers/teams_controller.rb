# encoding: utf-8
class TeamsController < ApplicationController
  before_filter :authenticate_team_user!
  # GET /teams
  # GET /teams.json
  before_filter :authenticate_team_user!
  def index
    @teams = Team.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @teams }
    end
  end

  # GET /teams/1
  # GET /teams/1.json
  def show
    @team = Team.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @team }
    end
  end

  # GET /teams/new
  # GET /teams/new.json
  def new

    @team = Team.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @team }
    end
  end

  # GET /teams/1/edit
  def edit
    @team = Team.find(params[:id])
  end

  # POST /teams
  # POST /teams.json
  def create
    @team = Team.new(params[:team])
      

    if @team.save

      @player = Player.new
      @player.name = "#{TeamUser.find(current_team_user.id).name}"
      @player.number = 0
      @player.team_id =@team.id
      @player.save

      if  @player.save
        @player_box_score = PlayerBoxScore.new
        @player_box_score.player_id = @player.id
        @player_box_score.assist =0
        @player_box_score.block  =0
        @player_box_score.steal  =0
        @player_box_score.turn_over  =0
        @player_box_score.personal_foul  =0
        @player_box_score.offensive_rebound  =0
        @player_box_score.defensive_rebound  =0
        @player_box_score.rebound_total =0
        @player_box_score.two_points_made =0
        @player_box_score.two_points_miss =0
        @player_box_score.three_points_made =0
        @player_box_score.three_points_miss =0
        @player_box_score.free_throw_made =0
        @player_box_score.free_throw_miss =0
        @player_box_score.points_total =0
        @player_box_score.save
      end
      @match = Match.new
      @match.user_id = current_team_user.id
      @match.state = 1
      @match.status = 3
      @match.team_id = @team.id
      @match.player_id = @player.id
      @match.save
    end

    
    respond_to do |format|
      if @team.save
        format.html { redirect_to :controller=>"team_users", :action=>"index",:id=>@team.id }

        format.json { render json: @team, status: :created, location: @team }
      else
        format.html { render action: "new" }
        format.json { render json: @team.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /teams/1
  # PUT /teams/1.json
  def update
    @team = Team.find(params[:id])

    respond_to do |format|
      if @team.update_attributes(params[:team])
        format.html { redirect_to @team, notice: 'Team was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @team.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /teams/1
  # DELETE /teams/1.json
  def destroy
    @team = Team.find(params[:id])
    @team.destroy

    respond_to do |format|
      format.html { redirect_to teams_url }
      format.json { head :no_content }
    end
  end
end
