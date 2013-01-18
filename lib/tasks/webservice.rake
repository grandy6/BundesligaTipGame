namespace :webservice do
require "webservice"

desc "Get all data for new saison"
task :new => [:get_teams_by_league_saison, :get_matchdata_by_league_saison]


#desc "get teams by league saison"
task :get_teams_by_league_saison => :environment do
	client = get_connection
	setting = get_settings

	response = client.request :get_teams_by_league_saison, body: { leagueShortcut: setting.league_short, leagueSaison: setting.league_saison }
  	if response.success?
      data = response.to_array(:get_teams_by_league_saison_response, :get_teams_by_league_saison_result, :team)
      if data
      	puts "Teams:"
      	data.each do |current_team|

        	tmp = Soccerteam.new
        	
        	tmp.team_number = current_team[:team_id]
        	tmp.team_name = current_team[:team_name]
        	tmp.team_icon_url = current_team[:team_icon_url]

        	tmp.save

        	puts tmp.team_name
        end
      end
    end
end

#desc "get matchdata by league saison"
task :get_matchdata_by_league_saison => :environment do
	client = get_connection
	setting = get_settings

  response = client.request :get_matchdata_by_league_saison, body: { leagueShortcut: setting.league_short, leagueSaison: setting.league_saison }
	if response.success?
    data = response.to_array(:get_matchdata_by_league_saison_response, :get_matchdata_by_league_saison_result, :matchdata)
    if data
    	puts "All matches:"
      data.each do |current_match|
      	
      	tmp = Match.new

      	tmp.match_number = current_match[:match_id]
      	tmp.match_date_time = current_match[:match_date_time]
      	tmp.time_zone_id = current_match[:time_zone_id]
      	tmp.match_date_time_utc = current_match[:match_date_time_utc]
      	tmp.group_order_id = current_match[:group_order_id]
      	tmp.group_name = current_match[:group_name]
      	tmp.league_id = current_match[:league_id]
      	tmp.league_name = current_match[:league_name]
      	tmp.league_saison = current_match[:league_saison]
      	tmp.league_shortcut = current_match[:league_shortcut]
      	tmp.name_team1 = current_match[:name_team1]
      	tmp.name_team2 = current_match[:name_team2]
      	tmp.id_team1 = current_match[:id_team1]
      	tmp.id_team2 = current_match[:id_team2]
      	tmp.icon_url_team1 = current_match[:icon_url_team1]
      	tmp.icon_url_team2 = current_match[:icon_url_team2]
      	tmp.points_team1 = current_match[:points_team1]
      	tmp.points_team2 = current_match[:points_team2]
      	tmp.last_update = current_match[:last_update]
      	tmp.match_is_finished = current_match[:match_is_finished]
      	#Da dieses Element noch Unterelemente besitzt, wird es erstmal außen vor gelassen
      	#match_results = current_match[:match_results]
      	#Da dieses Element noch Unterelemente besitzt, wird es erstmal außen vor gelassen
      	#goals = current_match[:goals]
      	#Da dieses Element noch Unterelemente besitzt, wird es erstmal außen vor gelassen
      	#location = current_match[:location]

      	tmp.save

      	puts tmp.name_team1 + " - " + tmp.name_team2
      end
    end
  end
end

#
#------------------------------------------------------------------------------------------------------------
#

desc "Update and evaluate matches"
task :update => :environment do
	client = get_connection
	setting = get_settings

  response = client.request :get_last_change_date_by_league_saison, body: { leagueShortcut: setting.league_short, leagueSaison: setting.league_saison }

    if response.success?
      data = response.to_hash[:get_last_change_date_by_league_saison_response][:get_last_change_date_by_league_saison_result]
      if data
        if data.to_s(:db) > setting.last_change.to_s(:db)
          #update_matchdata
          #Rake::Task["webservice:update_matchdata"].invoke
          Webservice::Base.update_matchdata(get_connection, get_settings)

          puts "Last change: " + data.to_s(:db)

          setting.last_change = data
          setting.save
        else
          puts "No change!"
        end
      end
    end
end

# #desc "Update match data"
# task :update_matchdata => :environment do
# 	client = get_connection
# 	setting = get_settings

#   response = client.request :get_matchdata_by_league_saison, body: { leagueShortcut: setting.league_short, leagueSaison: setting.league_saison }
# 	if response.success?
#     data = response.to_array(:get_matchdata_by_league_saison_response, :get_matchdata_by_league_saison_result, :matchdata)
#     if data
#       data.each do |current_match|
      	
#         tmp = Match.find_by_match_number(current_match[:match_id])
        
#         if !tmp.evaluated

#           tmp.match_date_time = current_match[:match_date_time]
#         	tmp.points_team1 = current_match[:points_team1]
#         	tmp.points_team2 = current_match[:points_team2]
#         	tmp.last_update = current_match[:last_update]
#         	tmp.match_is_finished = current_match[:match_is_finished]
#         	#Da dieses Element noch Unterelemente besitzt, wird es erstmal außen vor gelassen
#         	#match_results = current_match[:match_results]
#         	#Da dieses Element noch Unterelemente besitzt, wird es erstmal außen vor gelassen
#         	#goals = current_match[:goals]
#         	#Da dieses Element noch Unterelemente besitzt, wird es erstmal außen vor gelassen
#         	#location = current_match[:location]


#           if tmp.match_is_finished
#           	puts "--------------------------------------"
#           	puts tmp.name_team1 + " - " + tmp.name_team2
#             #Rake::Task["webservice:evaluate_match"].execute(tmp)
#             Webservice::Base.evaluate_match(tmp)
#             puts "evaluated tipps"
#             #Rake::Task["webservice:upadte_soccerteams"].execute(tmp)
#             Webservice::Base.upadte_soccerteams(tmp)
#             puts "updated soccerteams"

#             tmp.evaluated = true
#           end

#           tmp.save
#         end
#       end
#     end
#   end
# end

# #desc "Evaluate match"
# task :evaluate_match, [:current_match] => :environment do |t, args|

# 	current_match = args

# 	allTipps = Tipp.where("match_id = ?", current_match.id)

#   allTipps.each do |current_tipp|
#     if !current_tipp.checked?
    
#       # richtiger Tipp
#       if current_tipp.team1 == current_match.points_team1 && current_tipp.team2 == current_match.points_team2
#         current_tipp.points = 3
#       # richtige Tendenz
#       elsif current_tipp.team1 - current_tipp.team2 == current_match.points_team1 - current_match.points_team2
#         current_tipp.points = 2
#       # richtiger Sieger (Heimsieg)
#       elsif current_tipp.team1 - current_tipp.team2 > 0 && current_match.points_team1 - current_match.points_team2 > 0
#         current_tipp.points = 1
#       # richtiger Sieger (Auswärtssieg)
#       elsif current_tipp.team1 - current_tipp.team2 < 0 && current_match.points_team1 - current_match.points_team2 < 0
#         current_tipp.points = 1
#       # kompett flsch getippt
#       else
#         current_tipp.points = 0
#       end

#       current_tipp.checked = true
#       current_tipp.save

#       # Beim User ebenfalls die Punkte hinzufügen (zwecks späterer Performance)
#       current_user = User.find(current_tipp.user_id)
#       current_user.points += current_tipp.points
#       current_user.save

#       # User Punkte durch die Anzahl der Team-User teilen und diese dem Team zuweisen - Druchschnittspunkte
#       current_team = current_user.team
#       current_team.points += current_tipp.points / current_team.users.size.to_f
#       current_team.save

#       # output += "<br>Matchnumber: " + current_match.id.to_s
#       # output += " - Points: " + current_tipp.points.to_s
#       # output += " - Teamsize: " + current_team.users.size.to_s
#       # output += " - Team-avg: " + (current_tipp.points / current_team.users.size.to_f).to_s
#     end
#   end
# end

# #desc "Update Soccerteam"
# task :upadte_soccerteams, [:current_match] => :environment do |t, args|

# 	current_match = args

# 	current_team1 = Soccerteam.where("team_number = ?", current_match.id_team1).first
#   current_team2 = Soccerteam.where("team_number = ?", current_match.id_team2).first
  
#   if current_match.match_is_finished
#     current_team1.played_matches += 1;
#     current_team2.played_matches += 1;
#   end

#   if current_match.points_team1 > current_match.points_team2
#     current_team1.win += 1;
#     current_team2.lost += 1;

#     current_team1.points += 3;
#   elsif current_match.points_team1 < current_match.points_team2
#     current_team1.lost += 1;
#     current_team2.win += 1;

#     current_team2.points += 3;
#   else
#     current_team1.drawn += 1;
#     current_team2.drawn += 1;

#     current_team1.points += 1;
#     current_team2.points += 1;
#   end 

#   current_team1.goals_for += current_match.points_team1
#   current_team1.goals_against += current_match.points_team2

#   current_team2.goals_for += current_match.points_team2
#   current_team2.goals_against += current_match.points_team1
    
#   current_team1.save
#   current_team2.save
# end


def get_connection
  return Savon::Client.new("http://www.openligadb.de/Webservices/Sportsdata.asmx?WSDL")
end


def get_settings
  return Setting.first
end

end