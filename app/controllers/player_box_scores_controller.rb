class PlayerBoxScoresController < ApplicationController
  # GET /player_box_scores
  # GET /player_box_scores.json
  def index
    @two_points_made = 0
    @three_points_made = 0
    @count = 0
    #@player_box_scores = PlayerBoxScore.all
    #@players = Record.all
    @player = Record.where(:player_id => params[:id])
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
    end
  end

  # GET /player_box_scores/1
  # GET /player_box_scores/1.json
  def show
    @player_box_score = PlayerBoxScore.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @player_box_score }
    end
  end

  # GET /player_box_scores/new
  # GET /player_box_scores/new.json
  def new
    @player_box_score = PlayerBoxScore.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @player_box_score }
    end
  end

  # GET /player_box_scores/1/edit
  def edit
    @player_box_score = PlayerBoxScore.find(params[:id])
  end

  # POST /player_box_scores
  # POST /player_box_scores.json
  def create
    @player_box_score = PlayerBoxScore.new(params[:player_box_score])

    respond_to do |format|
      if @player_box_score.save
        format.html { redirect_to @player_box_score, notice: 'Player box score was successfully created.' }
        format.json { render json: @player_box_score, status: :created, location: @player_box_score }
      else
        format.html { render action: "new" }
        format.json { render json: @player_box_score.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /player_box_scores/1
  # PUT /player_box_scores/1.json
  def update
    @player_box_score = PlayerBoxScore.find(params[:id])

    respond_to do |format|
      if @player_box_score.update_attributes(params[:player_box_score])
        format.html { redirect_to @player_box_score, notice: 'Player box score was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @player_box_score.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /player_box_scores/1
  # DELETE /player_box_scores/1.json
  def destroy
    @player_box_score = PlayerBoxScore.find(params[:id])
    @player_box_score.destroy

    respond_to do |format|
      format.html { redirect_to player_box_scores_url }
      format.json { head :no_content }
    end
  end
end
