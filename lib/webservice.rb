module Webservice
	class Base
		
		def self.get_current_group(setting)
      client = Savon::Client.new("http://www.openligadb.de/Webservices/Sportsdata.asmx?WSDL")

      response = client.request :get_current_group, body: { leagueShortcut: setting.league_short }
      if response.success?
        data = response.to_array(:get_current_group_response, :get_current_group_result)
        if data
          return data[0][:group_order_id]
        end
      end
    end

		def self.update_matchdata(client, setting)
			client = get_connection
      setting = get_settings

      setting.current_group_id = get_current_group(setting)
      setting.save

      response = client.request :get_matchdata_by_league_saison, body: { leagueShortcut: setting.league_short, leagueSaison: setting.league_saison }
      if response.success?
        data = response.to_array(:get_matchdata_by_league_saison_response, :get_matchdata_by_league_saison_result, :matchdata)
        if data
          data.each do |current_match|
            
            tmp = Match.find_by_match_number(current_match[:match_id])
            
            if !tmp.evaluated

              tmp.match_date_time = current_match[:match_date_time]
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


              if tmp.match_is_finished
                puts "--------------------------------------"
                puts tmp.name_team1 + " - " + tmp.name_team2
                #Rake::Task["webservice:evaluate_match"].execute(tmp)
                evaluate_match(tmp)
                puts "evaluated tipps"
                #Rake::Task["webservice:upadte_soccerteams"].execute(tmp)
                upadte_soccerteams(tmp)
                puts "updated soccerteams"

                tmp.evaluated = true
              end

              tmp.save
            end
          end
        end
      end
    end

		def self.evaluate_match(current_match)
      allTipps = Tipp.where("match_id = ?", current_match.id)

      allTipps.each do |current_tipp|
        if !current_tipp.checked?
        
          # richtiger Tipp
          if current_tipp.team1 == current_match.points_team1 && current_tipp.team2 == current_match.points_team2
            current_tipp.points = 3
          # richtige Tendenz
          elsif current_tipp.team1 - current_tipp.team2 == current_match.points_team1 - current_match.points_team2
            current_tipp.points = 2
          # richtiger Sieger (Heimsieg)
          elsif current_tipp.team1 - current_tipp.team2 > 0 && current_match.points_team1 - current_match.points_team2 > 0
            current_tipp.points = 1
          # richtiger Sieger (Auswärtssieg)
          elsif current_tipp.team1 - current_tipp.team2 < 0 && current_match.points_team1 - current_match.points_team2 < 0
            current_tipp.points = 1
          # kompett flsch getippt
          else
            current_tipp.points = 0
          end

          current_tipp.checked = true
          current_tipp.save

          # Beim User ebenfalls die Punkte hinzufügen (zwecks späterer Performance)
          current_user = User.find(current_tipp.user_id)
          current_user.points += current_tipp.points
          current_user.save

          # User Punkte durch die Anzahl der Team-User teilen und diese dem Team zuweisen - Druchschnittspunkte
          current_team = current_user.team
          current_team.points += current_tipp.points / current_team.users.size.to_f
          current_team.save

          # output += "<br>Matchnumber: " + current_match.id.to_s
          # output += " - Points: " + current_tipp.points.to_s
          # output += " - Teamsize: " + current_team.users.size.to_s
          # output += " - Team-avg: " + (current_tipp.points / current_team.users.size.to_f).to_s
        end
      end    
		end

		def self.upadte_soccerteams(current_match)
			current_team1 = Soccerteam.where("team_number = ?", current_match.id_team1).first
      current_team2 = Soccerteam.where("team_number = ?", current_match.id_team2).first

      if current_match.match_is_finished
        current_team1.played_matches += 1;
        current_team2.played_matches += 1;
      end

      if current_match.points_team1 > current_match.points_team2
        current_team1.win += 1;
        current_team2.lost += 1;

        current_team1.points += 3;
      elsif current_match.points_team1 < current_match.points_team2
        current_team1.lost += 1;
        current_team2.win += 1;

        current_team2.points += 3;
      else
        current_team1.drawn += 1;
        current_team2.drawn += 1;

        current_team1.points += 1;
        current_team2.points += 1;
      end 

      current_team1.goals_for += current_match.points_team1
      current_team1.goals_against += current_match.points_team2

      current_team2.goals_for += current_match.points_team2
      current_team2.goals_against += current_match.points_team1
        
      current_team1.save
      current_team2.save
		end

	end
end

