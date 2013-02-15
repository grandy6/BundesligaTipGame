class TeamsController < ApplicationController
  # GET /teams
  # GET /teams.json
  def index
    if !current_user.team.nil?
      redirect_to action: "show", id: current_user.team.id
    else
      @team = Team.new

      @teams = Team.all

      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @teams }
      end
    end
  end

  # GET /teams/1
  # GET /teams/1.json
  def show
    @team = Team.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @team }
    end
  end

  # GET /teams/new
  # GET /teams/new.json
  def new
    @team = Team.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @team }
    end
  end

  # POST /teams
  # POST /teams.json
  def create
    @team = Team.new(params[:team])
    @team.owner_id = current_user.id

    respond_to do |format|
      if @team.save
        current_user.team = @team
        current_user.save
        format.html { redirect_to @team, notice: 'Team was successfully created.' }
        format.json { render json: @team, status: :created, location: @team }
      else
        format.html { render action: "new" }
        format.json { render json: @team.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /teams/1
  # DELETE /teams/1.json
  def destroy
    @team = Team.find(params[:id])
    @team.destroy

    respond_to do |format|
      format.html { redirect_to teams_url }
      format.json { head :no_content }
    end
  end

  # GET /teams/1  
  # GET /teams/1.json
  def join
    current_user.team = Team.find(params[:id])
    current_user.save

    redirect_to action: "show", id: current_user.team.id
  end

  # GET /teams 
  # GET /teams.json
  def exit
    @team = current_user.team
    current_user.team = nil
    current_user.save

    if @team.users.size == 0
      @team.destroy
    end

    redirect_to action: "index"
  end
end
