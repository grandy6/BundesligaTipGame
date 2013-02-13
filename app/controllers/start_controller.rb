require "webservice"

class StartController < ApplicationController
  authorize_resource :class => false

  def index
  end

  def tipp
  	if params.has_key?(:group_id_for_save)
  		tipp_save
  	# Begegnungen anzeigen
  	else
  		# Spieltag herausfinden, entweder als Paramter übergeben, oder vom WebService holen
  		if params.has_key?(:g)
  			group_id = params[:g]
  		else
		  	group_id = Webservice::Base.get_current_group(Setting.first) 
        #group_id = WsdlController.new.get_current_group
		  end

		  # Alle Spiele eines Spieltages holen
	  	@matches = Match.where("group_order_id = ?", group_id).order("match_date_time ASC")
  	end
  end

  def tipp_save
  	current_matches = Match.where("group_order_id = ?", params[:group_id_for_save])
  	current_matches.each do |m|

  		team1 = params[m.match_number.to_s + "_" + m.id_team1.to_s]
  		team2 = params[m.match_number.to_s + "_" + m.id_team2.to_s]

  		# Wenn team1 und 2 Eingaben haben, dann werden sie gepeichert
  		if !team1.blank? and !team2.blank?
				tipp = Tipp.new
  			
  			# schauen ob schon ein Tipp für dieses Spiel vorhanden ist
  			# wenn vorhanden, dann diesen bearbeiten und dann speichern
  			current_tipp = Tipp.where("user_id = ? and match_id = ?", current_user.id, m.id)
  			if current_tipp.size > 0
	  			tipp = current_tipp.first
	  		end
	  		
	  		tipp.team1 = team1.to_i
	  		tipp.team2 = team2.to_i
	  		tipp.points = 0
	  		tipp.user_id = current_user.id
	  		tipp.match_id = m.id

	  		tipp.save
	  	end
  	end
  	
  	redirect_to tipp_path(:g => params[:group_id_for_save])
	end

  def team
  	if params.has_key?(:team)
	  	team_create
	  elsif params.has_key?(:t)
	  	team_join
	  elsif params.has_key?(:d)
	  	team_exit
	  else
	  	team_show
	  end
  end

  def team_create
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
  end

  def team_join
  	@user = User.find(Encode.new.decrypt(params[:u]))
  	if @user.team_id.nil?
	  	@user.team_id = Encode.new.decrypt(params[:t])
	  	@user.save
	  end
  end

  def team_exit
  	current_user.team_id = nil
  	current_user.save

  	current_team = Team.find(Encode.new.decrypt(params[:d]))
  	
  	if current_team.users.size == 0
  		current_team.destroy
		end

  	redirect_to start_team_path
  end

  def team_show
  	@team = Team.new
    respond_to do |format|
      format.html # team.html.erb
      format.json { render json: @team }
  	end
	end

	def ranking 

	end

  def statistik

  end
end
