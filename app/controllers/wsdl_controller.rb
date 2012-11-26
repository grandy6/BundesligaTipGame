class WsdlController < ApplicationController
  
	def connect 
    @setting = Setting.first

		@client = Savon::Client.new("http://www.openligadb.de/Webservices/Sportsdata.asmx?WSDL")
		@output = ""
	end

	def get_all_for_new_saison
  	if @client.nil?
  		connect
  	end

		get_teams_by_league_saison
		get_matchdata_by_league_saison
	end

	def update_and_evaluate
  	if @client.nil?
      connect
    end
    response = @client.request :get_last_change_date_by_league_saison, body: { leagueShortcut: @setting.league_short, leagueSaison: @setting.league_saison }

    if response.success?
      data = response.to_hash[:get_last_change_date_by_league_saison_response][:get_last_change_date_by_league_saison_result]
      if data
        if data.to_s(:db) > @setting.last_change.to_s(:db)
          update_matchdata

          @output += "&Auml;nderungen gespeichert!"
          @output += "<br><br>setting date: " + @setting.last_change.to_s(:db) + "<br>wsdl date: " + data.to_s(:db)

          @setting.last_change = data
          @setting.save
        else
          @output += "Keine &Auml;nderung vorhanden!"
        end

      end
    end
	end


  def get_teams_by_league_saison
  	if @client.nil?
  		connect
  	end
  	response = @client.request :get_teams_by_league_saison, body: { leagueShortcut: @setting.league_short, leagueSaison: @setting.league_saison }
  	if response.success?
      data = response.to_array(:get_teams_by_league_saison_response, :get_teams_by_league_saison_result, :team)
      if data
      	@output += "<br><br><br><b>ALL TEAMS:</b><br><br>"
        data.each do |current_team|

        	@tmp = Soccerteam.new
        	
        	@tmp.team_number = current_team[:team_id]
        	@tmp.team_name = current_team[:team_name]
        	@tmp.team_icon_url = current_team[:team_icon_url]

        	@tmp.save

        	@output += @tmp.team_name + "<br>"
        end
      end
    end
  end

  def get_matchdata_by_league_saison
  	if @client.nil?
  		connect
  	end
  	response = @client.request :get_matchdata_by_league_saison, body: { leagueShortcut: @setting.league_short, leagueSaison: @setting.league_saison }
  	if response.success?
      data = response.to_array(:get_matchdata_by_league_saison_response, :get_matchdata_by_league_saison_result, :matchdata)
      if data
      	@output += "<br><br><br><b>ALL MATCHES:</b><br><br>"
        data.each do |current_match|
        	
        	@tmp = Match.new

        	@tmp.match_number = current_match[:match_id]
        	@tmp.match_date_time = current_match[:match_date_time]
        	@tmp.time_zone_id = current_match[:time_zone_id]
        	@tmp.match_date_time_utc = current_match[:match_date_time_utc]
        	@tmp.group_order_id = current_match[:group_order_id]
        	@tmp.group_name = current_match[:group_name]
        	@tmp.league_id = current_match[:league_id]
        	@tmp.league_name = current_match[:league_name]
        	@tmp.league_saison = current_match[:league_saison]
        	@tmp.league_shortcut = current_match[:league_shortcut]
        	@tmp.name_team1 = current_match[:name_team1]
        	@tmp.name_team2 = current_match[:name_team2]
        	@tmp.id_team1 = current_match[:id_team1]
        	@tmp.id_team2 = current_match[:id_team2]
        	@tmp.icon_url_team1 = current_match[:icon_url_team1]
        	@tmp.icon_url_team2 = current_match[:icon_url_team2]
        	@tmp.points_team1 = current_match[:points_team1]
        	@tmp.points_team2 = current_match[:points_team2]
        	@tmp.last_update = current_match[:last_update]
        	@tmp.match_is_finished = current_match[:match_is_finished]
        	#Da dieses Element noch Unterelemente besitzt, wird es erstmal außen vor gelassen
        	#match_results = current_match[:match_results]
        	#Da dieses Element noch Unterelemente besitzt, wird es erstmal außen vor gelassen
        	#goals = current_match[:goals]
        	#Da dieses Element noch Unterelemente besitzt, wird es erstmal außen vor gelassen
        	#location = current_match[:location]

        	@tmp.save

        	@output += @tmp.name_team1 + " - " + @tmp.name_team2 + "<br>"
        end
      end
    end
  end

  def update_matchdata
  	if @client.nil?
  		connect
  	end
  	response = @client.request :get_matchdata_by_league_saison, body: { leagueShortcut: @setting.league_short, leagueSaison: @setting.league_saison }
  	if response.success?
      data = response.to_array(:get_matchdata_by_league_saison_response, :get_matchdata_by_league_saison_result, :matchdata)
      if data
        data.each do |current_match|
        	
        	@tmp = Match.find_by_match_number(current_match[:match_id])

          @tmp.match_date_time = current_match[:match_date_time]
        	@tmp.points_team1 = current_match[:points_team1]
        	@tmp.points_team2 = current_match[:points_team2]
        	@tmp.last_update = current_match[:last_update]
        	@tmp.match_is_finished = current_match[:match_is_finished]
        	#Da dieses Element noch Unterelemente besitzt, wird es erstmal außen vor gelassen
        	#match_results = current_match[:match_results]
        	#Da dieses Element noch Unterelemente besitzt, wird es erstmal außen vor gelassen
        	#goals = current_match[:goals]
        	#Da dieses Element noch Unterelemente besitzt, wird es erstmal außen vor gelassen
        	#location = current_match[:location]

        	@tmp.save
        end
      end
    end
  end

  def get_current_group
  end

  def get_match_by_match_id
  end
end
