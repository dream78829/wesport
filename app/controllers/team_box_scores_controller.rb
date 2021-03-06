class TeamBoxScoresController < ApplicationController
  # GET /team_box_scores
  # GET /team_box_scores.json
  before_filter :authenticate_team_user!
    def index
    @leagues = League.all
    @two_points_made = 0
    @two_points_miss = 0
    @three_points_made = 0
    @three_points_miss = 0
    @free_throw_made = 0
    @free_throw_miss = 0
    @steal = 0
    @block = 0
    @assist = 0
    @personal_foul = 0
    @turn_over = 0
    @defensive_rebound = 0
    @offensive_rebound = 0
    @rebound_total = 0
    @points_total = 0
    @count = 0
    

    @players = Record.all


    #if params[:id] != nil
      @player = Record.where(:game_id => Game.where(:h_team_id => params[:id])).all
     # else
      #@player = Record.where(:game_id => Game.where(:h_team_id => current_team_user.id)).all
    #end
    #@sum = @player[1][:two_points_made] + @player[2][:two_points_made] + @player[0][:two_points_made] 
    
    @player.each do |lang|
        @two_points_made += lang[:two_points_made]
        @three_points_made += lang[:three_points_made]
        @two_points_miss += lang[:two_points_miss]
        @three_points_miss += lang[:three_points_miss]
        @free_throw_made += lang[:free_throw_made]
        @free_throw_miss += lang[:free_throw_miss]
        @steal += lang[:steal]
        @block += lang[:block]
        @assist += lang[:assist]
        @personal_foul += lang[:personal_foul]
        @turn_over += lang[:turn_over]
        @defensive_rebound += lang[:defensive_rebound]
        @offensive_rebound += lang[:offensive_rebound]
        @rebound_total += lang[:rebound_total]
        @points_total += lang[:points_total]
        @count += 1
    end
    @sum = [@two_points_made/@count.to_f,@two_points_miss/@count.to_f,@three_points_made/@count.to_f,@three_points_miss/@count.to_f,@free_throw_made/@count.to_f,@free_throw_miss/@count.to_f,@steal/@count.to_f,@block/@count.to_f,@assist/@count.to_f,@personal_foul/@count.to_f,@turn_over/@count.to_f,@offensive_rebound/@count.to_f,@defensive_rebound/@count.to_f,@rebound_total/@count.to_f,@points_total/@count.to_f]
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @sum }
      format.json { render json: @leagues }
      format.js { render 'populate_projects', :formats => [:js] }
    end
  end

  # GET /team_box_scores/1
  # GET /team_box_scores/1.json
  def show
    #@team_box_scores = Team_box_score.all
    @two_points_made = 0
    @three_points_made = 0
    @count = 0
    
    @players = Record.all
    @player = Record.where(:game_id => Game.where(:h_team_id => current_team_user.id,:league => params[:id])).all
    #@sum = @player[1][:two_points_made] + @player[2][:two_points_made] + @player[0][:two_points_made] 
    
    @player.each do |lang|
        @two_points_made += lang[:two_points_made]
        @three_points_made += lang[:three_points_made]
        @count += 1
    end
    @sum = [@two_points_made/@count.to_f,@three_points_made/@count.to_f]
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @sum }
      format.js { render 'populate_projects', :formats => [:js] }
    end
  end

  # GET /team_box_scores/new
  # GET /team_box_scores/new.json
  def new
    @team_box_score = TeamBoxScore.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @team_box_score }
    end
  end

  # GET /team_box_scores/1/edit
  def edit
    @team_box_score = TeamBoxScore.find(params[:id])
  end

  # POST /team_box_scores
  # POST /team_box_scores.json
  def create
    @team_box_score = TeamBoxScore.new(params[:team_box_score])

    respond_to do |format|
      if @team_box_score.save
        format.html { redirect_to @team_box_score, notice: 'Team box score was successfully created.' }
        format.json { render json: @team_box_score, status: :created, location: @team_box_score }
      else
        format.html { render action: "new" }
        format.json { render json: @team_box_score.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /team_box_scores/1
  # PUT /team_box_scores/1.json
  def update
    @team_box_score = TeamBoxScore.find(params[:id])

    respond_to do |format|
      if @team_box_score.update_attributes(params[:team_box_score])
        format.html { redirect_to @team_box_score, notice: 'Team box score was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @team_box_score.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /team_box_scores/1
  # DELETE /team_box_scores/1.json
  def destroy
    @team_box_score = TeamBoxScore.find(params[:id])
    @team_box_score.destroy

    respond_to do |format|
      format.html { redirect_to team_box_scores_url }
      format.json { head :no_content }
    end
  end
end
