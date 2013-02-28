require "webservice"

class StartController < ApplicationController
  authorize_resource :class => false

  def index
    @news = News.last
  end

  def tipp
  	if params.has_key?(:group_id_for_save)
  		tipp_save
  	# Begegnungen anzeigen
  	else
      @setting = Setting.first
  		# Spieltag herausfinden, entweder als Paramter übergeben, oder vom WebService holen
  		if params.has_key?(:g)
  			group_id = params[:g]
  		else
		  	group_id = @setting.current_group_id
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
end
