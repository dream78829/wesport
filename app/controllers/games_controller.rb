class GamesController < ApplicationController
  # GET /games
  # GET /games.json
  before_filter :authenticate_team_user!
  before_filter :getStatusLevel, only: [:new,:create,:edit, :update, :destroy]
  def index
    @games = Game.where(:h_team_id => params[:tid]).all
    @init = params[:tid]
    if Match.where(:team_id=>@init,:user_id=>current_team_user,:state=>1).first.blank?
      @statusLevel =0
    else
      @statusLevel = Match.where(:team_id=>@init,:user_id=>current_team_user,:state=>1).first.status
    end
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @games }
    end
  end

  # GET /games/1
  # GET /games/1.json
  def show
    redirect_to root_url
    #@game = Game.find(params[:id])

    #respond_to do |format|
    #  format.html # show.html.erb
    #  format.json { render json: @game }
    #end
  end

  # GET /games/new
  # GET /games/new.json
  def new
    
    @game = Game.new
    @game.h_team_id = params[:tid]
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @game }
    end
  end

  # GET /games/1/edit
  def edit
    @game = Game.find(params[:id])
  end

  # POST /games
  # POST /games.json
  def create
    @game = Game.new(params[:game])
    respond_to do |format|
      if @game.save
        format.html { redirect_to :controller=>"records",:action => "index",:gid =>@game.id }
        format.json { render json: @game, status: :created, location: @game }
      else
        format.html { render action: "new" }
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /games/1
  # PUT /games/1.json
  def update
    @game = Game.find(params[:id])

    respond_to do |format|
      if @game.update_attributes(params[:game])
        format.html { redirect_to :controller=>"records",:action => "index",:id =>@game.id }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /games/1
  # DELETE /games/1.json
  def destroy
    @game = Game.find(params[:id])
    @record = Record.where(:game_id => @game.id).all
    @record.each do |x|
      x.destroy
    end
    @game.destroy

    respond_to do |format|
      format.html { redirect_to games_url }
      format.json { head :no_content }
    end
  end
  protected
  def getStatusLevel
    @step =1
    if params[:tid].blank?
      if params[:gid].blank?
        @statusLevel = 0
        @step =2
      else
        @team_id = Game.find(params[:gid]).h_team_id
        @step =3
      end
    else
        @team_id = params[:tid]
        @step =4
    end


    if @team_id.blank?
      @statusLevel = 0
      @step =5
    else
      if Match.where(:team_id => @team_id, :state => 1,:user_id => current_team_user.id).first.blank?
        @statusLevel = 0
        @step =6
      else
        @statusLevel=Match.where(:team_id => @team_id, :state => 1,:user_id => current_team_user.id).first.status
        @step =7
      end
      if @statusLevel!=3
        @step =8
        redirect_to root_path
      end
    end
  end
end
