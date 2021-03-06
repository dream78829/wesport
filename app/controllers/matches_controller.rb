# encoding: utf-8
class MatchesController < ApplicationController
  # GET /matches
  # GET /matches.json
  before_filter :getStatusLevel, only: [:edit, :update, :destroy]

  def index
    redirect_to root_url
    #avoid user to access this page directly
    #@matches = Match.all

    #respond_to do |format|
    #  format.html # index.html.erb
    #  format.json { render json: @matches }
    #end
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
    redirect_to root_url
    #avoid user to access this page directly
    #@match = Match.new

    #respond_to do |format|
    #  format.html # new.html.erb
    #  format.json { render json: @match }
    #end
  end

  # GET /matches/1/edit
  def edit
    redirect_to root_url
    #avoid user to access this page directly
    #@match = Match.find(params[:id])
  end

  # POST /matches
  # POST /matches.json
  def create
    #get code
    @getCode = params[:code]

    #new a 'match' object
    @match = Match.new(params[:match])

    #get code or not
    if !@getCode.blank?
      @team_id=@match.team_id
      @match.user_id = current_team_user.id
      @match.state = 0
      @checkCode = Team.where(:id => @match.team_id ).first
      # if status is manager, the player attribute must be blank
      if @match.status==2
        @match.player_id =nil
      end

      #check the code is correctly and status must be 1 or 2
      if @getCode.to_s == @checkCode.code.to_s &&(@match.status.to_f == 1 ||@match.status.to_f == 2)
        #check this applier have any same apply or confirm already
        if Match.where(:team_id =>@match.team_id,:user_id=>current_team_user.id).first.blank?
          
          #check is this player confirm already or not
          if Match.where(:team_id =>@match.team_id,:player_id=>@match.player_id,:state=>1,:status=>1).first.blank?
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
          flash[:notice] = 2
        redirect_to :controller=>"welcome",:action=>"teamInfo",:tid=>@match.team_id
        end
      else
        flash[:notice] = 0
        redirect_to :controller=>"welcome",:action=>"teamInfo",:tid=>@match.team_id
      end
    else
      flash[:notice] = 3
      redirect_to :controller=>"welcome",:action=>"teamInfo",:tid=>@match.team_id
    end
  end

  # PUT /matches/1
  # PUT /matches/1.json
  def update
    @match = Match.find(params[:id])


    respond_to do |format|
      if @match.update_attributes(params[:match])
        redirect_to :controller=>"team_user",:action=>"IDconfirm",:tid=>@match.team_id
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @match.errors, status: :unprocessable_entity }
      end
    end
  end

  def confirm
    @team = Match.find(params[:id])
    @match = Match.find(params[:id])
    @match.state=1


    respond_to do |format|
      if @match.update_attributes(params[:match])
        redirect_to :controller=>"team_user",:action=>"IDconfirm",:tid=>@team 
        format.json { head :no_content }
      else
        redirect_to :controller=>"team_user",:action=>"IDconfirm",:tid=>@team
        format.json { render json: @match.errors, status: :unprocessable_entity }
      end
    end
  end

  def changeCaptian
    @newCaptianID = params[:iddd]
    if @newCaptianID.to_i !=0
      @newCaptian = Match.find(params[:iddd])
      @currentCaptian = Match.where(:user_id=>current_team_user,:team_id=>@newCaptian.team_id,:status=>3,:state=>1).first
      if @newCaptian.update_attributes(:status=>3)
        if @currentCaptian.update_attributes(:status=>1)
          redirect_to :controller=>"team_users",:action=>"index",:tid=>@newCaptian.team_id
        else
           redirect_to :back
        end
      else
        redirect_to :back
      end
    else
      redirect_to :back
    end
  end

  # DELETE /matches/1
  # DELETE /matches/1.json
  def destroy
    @match = Match.find(params[:id])
    @team = Match.find(params[:id]).team_id
    @match.destroy

    if @team.blank?
      respond_to do |format|
        format.html { redirect_to root_url }
        format.json { head :no_content }
      end
    else
      redirect_to :controller=>"team_user",:action=>"IDconfirm",:tid=>@team
    end
  end

  protected
  def getStatusLevel
    if params[:tid].blank?
      if params[:gid].blank?
        @statusLevel = 0
      else
        @team_id = Game.find(params[:gid]).h_team_id
      end
    else
        @team_id = params[:tid]
    end

    if @team_id.blank?
      redirect_to root_path
    else
      if Match.where(:team_id => @team_id, :state => 1,:user_id => current_team_user.id).first.blank?
        @statusLevel = 0
      else
        @statusLevel=Match.where(:team_id => @team_id, :state => 1,:user_id => current_team_user.id).first.status
      end
    end

    if @statusLevel!=3
      redirect_to root_path
    end
  end
end
