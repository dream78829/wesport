class PlayersController < ApplicationController
  # GET /players
  # GET /players.json
  before_filter :authenticate_team_user!
  def index

    @init =params[:id]

    @players = Player.where(:team_id => params[:id]).all
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @test }
    end
  end

  # GET /players/1
  # GET /players/1.json
  def show
    @player = Player.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @player }
    end
  end

  # GET /players/new
  # GET /players/new.json
  def new
    @player = Player.new
    @player.team_id = params[:id]
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @player }
    end
  end

  # GET /players/1/edit
  def edit
    @player = Player.find(params[:id])
  end

  # POST /players
  # POST /players.json
 def create
    @player = Player.new(params[:player])
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
    respond_to do |format|
      if @player.save

        format.html { redirect_to :controller=>"players",:action => "index",:id=>@player.team_id }

        format.json { render json: @player, status: :created, location: @player }
      else
        format.html { render action: "new" }
        format.json { render json: @player.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /players/1
  # PUT /players/1.json
  def update
    @player = Player.find(params[:id])

    respond_to do |format|
      if @player.update_attributes(params[:player])
        format.html { redirect_to @player, notice: 'Player was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @player.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /players/1
  # DELETE /players/1.json
  def destroy
    @player = Player.find(params[:id])
    @team = @player.team_id
    @match = Match.where(:player_id => @player.id).all
      @match.each do |x|
        x.destroy
    end
    
    record = Record.where(:player_id => @player.id).all
    record.each do |lang|
      lang.destroy
    end
    #@record.destroy#destroy不能一次刪除這個陣列
    @player.destroy
    respond_to do |format|
      format.html { redirect_to :controller=>"team_users",:action=>"index" ,:id =>  @team}
      format.json { head :no_content }
    end
  end
end
