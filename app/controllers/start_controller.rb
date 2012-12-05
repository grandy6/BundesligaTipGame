class StartController < ApplicationController
  def index
  end

  def team
  	# Team gründen
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
	  # einem Team beitreten
	  elsif params.has_key?(:t)
	  	@user = User.find(Encode.new.decrypt(params[:u]))
	  	if @user.team_id.nil?
		  	@user.team_id = Encode.new.decrypt(params[:t])
		  	@user.save
		  end	  
	  # Team verlassen
	  elsif params.has_key?(:d)
	  	current_user.team_id = nil
	  	current_user.save

	  	current_team = Team.find(Encode.new.decrypt(params[:d]))
	  	
	  	if current_team.users.size == 0
	  		current_team.destroy
  		end

	  	redirect_to start_team_path
	  else
	  	@team = Team.new

	    respond_to do |format|
	      format.html # team.html.erb
	      format.json { render json: @team }
    end
	  end
  end
end
