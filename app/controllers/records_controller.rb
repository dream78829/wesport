class RecordsController < ApplicationController
  # GET /records
  # GET /records.json
  before_filter :authenticate_team_user!, except: [:index]

  def index

    @game = Game.find(params[:id])
    @records = Record.order("starter DESC").where(:game_id => params[:id]).all

    #計算賽事數據加總
    @total[:assist] = 0
    @total[:block] = 0
    @total[:steal] = 0
    @total[:personal_foul] = 0
    @total[:turn_over] = 0
    @total[:offensive_rebound] = 0
    @total[:defensive_rebound] = 0
    @total[:rebound_total] = 0
    @total[:two_points_made] =0
    @total[:two_points_miss] = 0
    @total[:three_points_made] = 0
    @total[:three_points_miss] = 0
    @total[:free_throw_made] = 0
    @total[:free_throw_miss] = 0
    @total[:points_total] = 0
    @records.each do |x|
      @total[:assist] += x.assist
      @total[:block] += x.block
      @total[:steal] += x.steal
      @total[:personal_foul] += x.personal_foul
      @total[:turn_over] += turn_over
      @total[:offensive_rebound] += offensive_rebound
      @total[:defensive_rebound] += defensive_rebound
      @total[:rebound_total] += rebound_total
      @total[:two_points_made] += two_points_made
      @total[:two_points_miss] += two_points_miss
      @total[:three_points_made] += three_points_made
      @total[:three_points_miss] += three_points_miss
      @total[:free_throw_made] += free_throw_made
      @total[:free_throw_miss] += free_throw_miss
      @total[:points_total] += points_total
    end
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @records }
      format.json { render json: @total }
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
    @record.game_id = params[:id]
    @team = Game.find(params[:id]).h_team_id
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @record }
    end
  end

  # GET /records/1/edit
  def edit
    @record = Record.find(params[:id])
    session[:assist] = @record.assist
    session[:block] = @record.block
    session[:steal] = @record.steal
    session[:turn_over] = @record.turn_over
    session[:personal_foul] = @record.personal_foul
    session[:offensive_rebound] = @record.offensive_rebound
    session[:defensive_rebound] = @record.defensive_rebound
    session[:rebound_total] = @record.rebound_total
    session[:two_points_made] = @record.two_points_made
    session[:two_points_miss] = @record.two_points_miss
    session[:three_points_made] = @record.three_points_made
    session[:three_points_miss] = @record.three_points_miss
    session[:free_throw_made] = @record.free_throw_made
    session[:free_throw_miss] = @record.free_throw_miss
    session[:points_total] = @record.points_total
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
        session[:assist] = nil
        session[:block] = nil
        session[:steal] = nil
        session[:turn_over] = nil
        session[:personal_foul] = nil
        session[:offensive_rebound] = nil
        session[:defensive_rebound] = nil
        session[:rebound_total] = nil
        session[:two_points_made] = nil
        session[:two_points_miss] = nil
        session[:three_points_made] = nil
        session[:three_points_miss] = nil
        session[:free_throw_made] = nil
        session[:free_throw_miss] = nil
        session[:points_total] = nil
      end



    respond_to do |format|
      if @record.save
        format.html { redirect_to :controller =>"records",:action=>"index",:id=>@record.game_id }
        format.json { render json: @record, status: :created, location: @record }
      else
        format.html { redirect_to :controller=>"records", :action=>"new",:id=>@record.game_id}
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
    

    if @record.update_attributes(params[:record])
        @player_box_score = PlayerBoxScore.where(:player_id => @record.player_id).first
        @player_box_score.assist -= session[:assist] += @record.assist
        @player_box_score.block -= session[:block] += @record.block
        @player_box_score.steal -= session[:steal] += @record.steal
        @player_box_score.turn_over -= session[:turn_over] += @record.turn_over
        @player_box_score.personal_foul -= session[:personal_foul] += @record.personal_foul
        @player_box_score.offensive_rebound -= session[:offensive_rebound] += @record.offensive_rebound
        @player_box_score.defensive_rebound -= session[:defensive_rebound] += @record.defensive_rebound
        @player_box_score.rebound_total -= session[:rebound_total] += @record.rebound_total
        @player_box_score.two_points_made -= session[:two_points_made] += @record.two_points_made
        @player_box_score.two_points_miss -= session[:two_points_miss] += @record.two_points_miss
        @player_box_score.three_points_made -= session[:three_points_made] += @record.three_points_made
        @player_box_score.three_points_miss -= session[:three_points_miss] += @record.three_points_miss
        @player_box_score.free_throw_made -= session[:free_throw_made] += @record.free_throw_made
        @player_box_score.free_throw_miss -= session[:free_throw_miss] += @record.free_throw_miss
        @player_box_score.points_total -= session[:points_total] += @record.points_total
        @player_box_score.save
 
      end
    respond_to do |format|
      if @record.update_attributes(params[:record])
        format.html { redirect_to @record, notice: 'Record was successfully updated.' }
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
    @player_box_score = PlayerBoxScore.where(:player_id => @record.player_id).first
        @player_box_score.assist -= @record.assist
        @player_box_score.block -= @record.block
        @player_box_score.steal -= @record.steal
        @player_box_score.turn_over -= @record.turn_over
        @player_box_score.personal_foul -= @record.personal_foul
        @player_box_score.offensive_rebound -= @record.offensive_rebound
        @player_box_score.defensive_rebound -= @record.defensive_rebound
        @player_box_score.rebound_total -= @record.rebound_total
        @player_box_score.two_points_made -= @record.two_points_made
        @player_box_score.two_points_miss -= @record.two_points_miss
        @player_box_score.three_points_made -= @record.three_points_made
        @player_box_score.three_points_miss -= @record.three_points_miss
        @player_box_score.free_throw_made -= @record.free_throw_made
        @player_box_score.free_throw_miss -= @record.free_throw_miss
        @player_box_score.points_total -= @record.points_total
        @player_box_score.save
    @record.destroy

    respond_to do |format|
      format.html { redirect_to :controller => "records",:action=>"index", :id =>@temp }
      format.json { render json: @temp }
    end
  end
end
