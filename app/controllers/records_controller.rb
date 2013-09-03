class RecordsController < ApplicationController
  # GET /records
  # GET /records.json
  before_filter :authenticate_team_user!, except: [:index]
  before_filter :getStatusLevel, only: [:new,:create,:edit, :update, :destroy]

  def index

    @game = Game.find(params[:gid])
    
    @records = Record.order("starter DESC").where(:game_id => params[:gid]).all

    if Match.where(:team_id=>@game.h_team_id,:user_id=>current_team_user,:state=>1).first.blank?
      @statusLevel =0
    else
      @statusLevel = Match.where(:team_id=>@game.h_team_id,:user_id=>current_team_user,:state=>1).first.status
    end
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @records }
    end
  end

  # GET /records/1
  # GET /records/1.json
  def show
    @record = Record.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @record }
    end
  end

  # GET /records/new
  # GET /records/new.json
  def new
    @record = Record.new
    @record.game_id = params[:gid]
    @team = Game.find(params[:gid]).h_team_id
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @record }
    end
  end

  # GET /records/1/edit
  def edit
    @record = Record.find(params[:id])
    @temp = Record.find(params[:id])
  end

  # POST /records
  # POST /records.json
  def create
    @record = Record.new(params[:record])
    @record.rebound_total = @record.defensive_rebound + @record.offensive_rebound
    @record.points_total = @record.free_throw_made + @record.two_points_made*2 + @record.three_points_made*3
    @record.efficiency_formula = @record.points_total + @record.assist + @record.rebound_total + @record.steal + @record.block - @record.two_points_miss - @record.three_points_miss - @record.free_throw_miss - @record.turn_over


    if @record.save
        @player_box_score = PlayerBoxScore.where(:player_id => @record.player_id).first
        @player_box_score.assist += @record.assist
        @player_box_score.block += @record.block
        @player_box_score.steal += @record.steal
        @player_box_score.turn_over += @record.turn_over
        @player_box_score.personal_foul += @record.personal_foul
        @player_box_score.offensive_rebound += @record.offensive_rebound
        @player_box_score.defensive_rebound += @record.defensive_rebound
        @player_box_score.rebound_total += @record.rebound_total
        @player_box_score.two_points_made += @record.two_points_made
        @player_box_score.two_points_miss += @record.two_points_miss
        @player_box_score.three_points_made += @record.three_points_made
        @player_box_score.three_points_miss += @record.three_points_miss
        @player_box_score.free_throw_made += @record.free_throw_made
        @player_box_score.free_throw_miss += @record.free_throw_miss
        @player_box_score.points_total += @record.points_total
        @player_box_score.save
 
      end



    respond_to do |format|
      if @record.save
        format.html { redirect_to :controller =>"records",:action=>"index",:gid=>@record.game_id }
        format.json { render json: @record, status: :created, location: @record }
      else
        format.html { redirect_to :controller=>"records", :action=>"new",:gid=>@record.game_id}
        format.json { render json: @record.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /records/1
  # PUT /records/1.json
  def update
    @record = Record.find(params[:id])
    @record.rebound_total = @record.defensive_rebound + @record.offensive_rebound
    @record.points_total = @record.free_throw_made + @record.two_points_made*2 + @record.three_points_made*3
    @record.efficiency_formula = @record.points_total + @record.assist + @record.rebound_total + @record.steal + @record.block - @record.two_points_miss - @record.three_points_miss - @record.free_throw_miss - @record.turn_over
    

    respond_to do |format|
      if @record.update_attributes(params[:record])
        format.html { redirect_to :controller =>"records",:action=>"index",:id=>@record.game_id }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @record.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /records/1
  # DELETE /records/1.json
  def destroy
    @temp = Record.find(params[:id]).game_id
    @record = Record.find(params[:id])
    @record.destroy

    respond_to do |format|
      format.html { redirect_to :controller => "records",:action=>"index", :id =>@temp }
      format.json { render json: @temp }
    end
  end

  protected
  
  def getStatusLevel
    #if get variables 'tid' or 'gid' ,init @statusLevel object

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
