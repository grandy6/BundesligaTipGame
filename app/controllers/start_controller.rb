class StartController < ApplicationController
  def index
  end

  def team
  	if params.has_key?(:team)
	  	@team = Team.new(params[:team])
	  	@team.owner_id = current_user.id

	  	respond_to do |format|
	      if @team.save
	      	@user = current_user
	      	@user.team_id = @team.id
	      	@user.save

	        format.html { redirect_to start_team_path, notice: 'team was successfully created.' }
	        format.json { render json: @team, status: :created, location: @team }
	      else
	        format.html { render action: "team" }
	        format.json { render json: @team.errors, status: :unprocessable_entity }
	      end
	    end

	  else
	  	@team = Team.new

	    respond_to do |format|
	      format.html # team.html.erb
	      format.json { render json: @team }
    end
	  end
  end
end
