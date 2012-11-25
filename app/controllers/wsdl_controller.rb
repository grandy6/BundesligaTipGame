class WsdlController < ApplicationController

	$liga_id = 456
	$liga_short = "bl1"
	$saison = 2012

	def connect
		@client = Savon::Client.new("http://www.openligadb.de/Webservices/Sportsdata.asmx?WSDL")
		@output = ""
	end

	def get_all_for_new_saison
		get_teams_by_league_saison
		get_matchdata_by_league_saison
	end

  def get_teams_by_league_saison
  	if @client.nil?
  		connect
  	end
  	@response = @client.request :get_teams_by_league_saison, body: { leagueShortcut: $liga_short, leagueSaison: $saison }
  	if @response.success?
      data = @response.to_array(:get_teams_by_league_saison_response, :get_teams_by_league_saison_result, :team)
      if data
      	@output += "<br><br><br><b>ALL TEAMS:</b><br><br>"
        data.each do |current_team|
        	team_id = current_team[:team_id]
        	team_name = current_team[:team_name]
        	team_icon_url = current_team[:team_icon_url]

        	@output += team_name + "<br>"
        end
      end
    end
  end

  def get_matchdata_by_league_saison
  	if @client.nil?
  		connect
  	end
  	@response = @client.request :get_matchdata_by_league_saison, body: { leagueShortcut: $liga_short, leagueSaison: $saison }
  	if @response.success?
      data = @response.to_array(:get_matchdata_by_league_saison_response, :get_matchdata_by_league_saison_result, :matchdata)
      if data
      	@output += "<br><br><br><b>ALL MATCHES:</b><br><br>"
        data.each do |current_match|
        	match_id = current_match[:match_id]
        	match_date_time = current_match[:match_date_time]
        	time_zone_id = current_match[:time_zone_id]
        	match_date_time_utc = current_match[:match_date_time_utc]
        	group_order_id = current_match[:group_order_id]
        	group_name = current_match[:group_name]
        	league_id = current_match[:league_id]
        	league_name = current_match[:league_name]
        	league_saison = current_match[:league_saison]
        	league_shortcut = current_match[:league_shortcut]
        	name_team1 = current_match[:name_team1]
        	name_team2 = current_match[:name_team2]
        	id_team1 = current_match[:id_team1]
        	icon_url_team1 = current_match[:icon_url_team1]
        	icon_url_team2 = current_match[:icon_url_team2]
        	points_team1 = current_match[:points_team1]
        	points_team2 = current_match[:points_team2]
        	last_update = current_match[:last_update]
        	match_is_finished = current_match[:match_is_finished]
        	#Da dieses Element noch Unterelemente besitzt, wird es erstmal außen vor gelassen
        	#match_results = current_match[:match_results]
        	#Da dieses Element noch Unterelemente besitzt, wird es erstmal außen vor gelassen
        	#goals = current_match[:goals]
        	#Da dieses Element noch Unterelemente besitzt, wird es erstmal außen vor gelassen
        	location = current_match[:location]

        	@output += name_team1 + " - " + name_team2 + "<br>"
        end
      end
    end
  end

  def get_current_group
  end

  def get_match_by_match_id
  end
end
