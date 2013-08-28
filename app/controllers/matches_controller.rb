class MatchesController < ApplicationController
  # GET /matches
  # GET /matches.json
  def index
    @matches = Match.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @matches }
    end
  end

  # GET /matches/1
  # GET /matches/1.json
  def show
    @match = Match.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @match }
    end
  end

  # GET /matches/new
  # GET /matches/new.json
  def new
    @match = Match.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @match }
    end
  end

  # GET /matches/1/edit
  def edit
    @match = Match.find(params[:id])
  end

  # POST /matches
  # POST /matches.json
  def create
    @getCode = params[:code]
    @match = Match.new(params[:match])
    if !@getCode.blank?
      @team_id=@match.team_id
      @match.user_id = current_team_user.id
      @match.state = 0
      @checkCode = Team.where(:id => @match.team_id ).first
      if @match.status==2
        @match.player_id =nil
      end
      if @getCode.to_s == @checkCode.code.to_s &&(@match.status.to_f == 1 ||@match.status.to_f == 2)
        respond_to do |format|
          if @match.save
            flash[:notice] = 1
            format.html { redirect_to :controller=>"welcome",:action=>"teamInfo",:tid=>@match.team_id }
            format.json { render json: @match, status: :created, location: @match }
          end
        end
      else
        flash[:notice] = 0
        redirect_to :controller=>"welcome",:action=>"teamInfo",:tid=>@match.team_id
      end
    else
      flash[:notice] = 0
      redirect_to :controller=>"welcome",:action=>"teamInfo",:tid=>@match.team_id
    end
  end

  # PUT /matches/1
  # PUT /matches/1.json
  def update
    @match = Match.find(params[:id])

    respond_to do |format|
      if @match.update_attributes(params[:match])
        format.html { redirect_to @match, notice: 'Match was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @match.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /matches/1
  # DELETE /matches/1.json
  def destroy
    @match = Match.find(params[:id])
    @match.destroy

    respond_to do |format|
      format.html { redirect_to matches_url }
      format.json { head :no_content }
    end
  end
end
