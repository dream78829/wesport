class RecordsController < ApplicationController
  # GET /records
  # GET /records.json
  before_filter :authenticate_team_user!

  def index

    @game = Game.find(params[:id])

    @records = Record.order("starter DESC").where(:game_id => params[:id]).all

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
    @record.game_id = params[:id]
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @record }
    end
  end

  # GET /records/1/edit
  def edit
    @record = Record.find(params[:id])
  end

  # POST /records
  # POST /records.json
  def create
    @record = Record.new(params[:record])

    @record.points_total = @record.free_throw_made + @record.two_points_made*2 + @record.three_points_made*3
    @record.efficiency_formula = @record.points_total + @record.assist + @record.rebound_total + @record.steal + @record.block - @record.two_points_miss - @record.three_points_miss - @record.free_throw_miss - @record.turn_over

    respond_to do |format|
      if @record.save
        format.html { redirect_to @record, notice: 'Record was successfully created.' }
        format.json { render json: @record, status: :created, location: @record }
      else
        format.html { render action: "new" }
        format.json { render json: @record.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /records/1
  # PUT /records/1.json
  def update
    @record = Record.find(params[:id])

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
    @record.destroy

    respond_to do |format|
      format.html { redirect_to :controller => "records",:action=>"index", :id =>@temp }
      format.json { render json: @temp }
    end
  end
end
