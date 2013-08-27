class PlayersController < ApplicationController
  # GET /players
  # GET /players.json
  before_filter :authenticate_team_user!
  def index
<<<<<<< HEAD
=======
    @init =params[:id]
>>>>>>> fc0233815f8d874d0d15d4d8e8a7fffd23d2aec8
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
        @player_box_score.save
  end
    respond_to do |format|
      if @player.save
<<<<<<< HEAD
        format.html { redirect_to :controller=>"team_users",:action => "index",:id=>@player.team_id }
=======
        format.html { redirect_to :controller=>"players",:action => "index",:id=>@player.team_id }
>>>>>>> Eric
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
    @match = Match.where(:player_id => @player.id,:user_id => current_team_user.id)
    @match.destroy
    
    record = Record.where(:player_id => @player.id).all
    record.each do |lang|
      lang.destroy
    end
    #@record.destroy#destroy不能一次刪除這個陣列
    @player.destroy
    respond_to do |format|
      format.html { redirect_to players_url }
      format.json { head :no_content }
    end
  end
end
