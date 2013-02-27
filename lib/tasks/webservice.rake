require "webservice"

namespace :webservice do

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

#
#------------------------------------------------------------------------------------------------------------
#

desc "Insert some test tipps"
task :tipp => :environment do
  mark = User.find_by_username('mark')
  kai = User.find_by_username('kai')
  paul = User.find_by_username('paul')
  rainer = User.find_by_username('rainer')

  match1 = Match.find(1)
  Tipp.create team1: 2,
              team2: 4,
              user_id: mark.id,
              match_id: match1.id,
              checked: false
  Tipp.create team1: 3,
              team2: 1,
              user_id: kai.id,
              match_id: match1.id,
              checked: false
  Tipp.create team1: 2,
              team2: 0,
              user_id: paul.id,
              match_id: match1.id,
              checked: false
  Tipp.create team1: 1,
              team2: 1,
              user_id: rainer.id,
              match_id: match1.id,
              checked: false

  match2 = Match.find(2)
  Tipp.create team1: 5,
              team2: 0,
              user_id: mark.id,
              match_id: match2.id,
              checked: false
  Tipp.create team1: 2,
              team2: 2,
              user_id: kai.id,
              match_id: match2.id,
              checked: false
  Tipp.create team1: 3,
              team2: 0,
              user_id: paul.id,
              match_id: match2.id,
              checked: false
  Tipp.create team1: 3,
              team2: 1,
              user_id: rainer.id,
              match_id: match2.id,
              checked: false

  match3 = Match.find(3)
  Tipp.create team1: 2,
              team2: 1,
              user_id: mark.id,
              match_id: match3.id,
              checked: false
  Tipp.create team1: 2,
              team2: 1,
              user_id: kai.id,
              match_id: match3.id,
              checked: false
  Tipp.create team1: 1,
              team2: 2,
              user_id: paul.id,
              match_id: match3.id,
              checked: false
  Tipp.create team1: 2,
              team2: 1,
              user_id: rainer.id,
              match_id: match3.id,
              checked: false

  match4 = Match.find(4)
  Tipp.create team1: 2,
              team2: 1,
              user_id: mark.id,
              match_id: match4.id,
              checked: false
  Tipp.create team1: 0,
              team2: 1,
              user_id: kai.id,
              match_id: match4.id,
              checked: false
  Tipp.create team1: 2,
              team2: 2,
              user_id: paul.id,
              match_id: match4.id,
              checked: false
  Tipp.create team1: 3,
              team2: 1,
              user_id: rainer.id,
              match_id: match4.id,
              checked: false

  match5 = Match.find(5)
  Tipp.create team1: 0,
              team2: 1,
              user_id: mark.id,
              match_id: match5.id,
              checked: false
  Tipp.create team1: 2,
              team2: 0,
              user_id: kai.id,
              match_id: match5.id,
              checked: false
  Tipp.create team1: 1,
              team2: 1,
              user_id: paul.id,
              match_id: match5.id,
              checked: false
  Tipp.create team1: 2,
              team2: 1,
              user_id: rainer.id,
              match_id: match5.id,
              checked: false

  match6 = Match.find(6)
  Tipp.create team1: 0,
              team2: 1,
              user_id: mark.id,
              match_id: match6.id,
              checked: false
  Tipp.create team1: 0,
              team2: 2,
              user_id: kai.id,
              match_id: match6.id,
              checked: false
  Tipp.create team1: 1,
              team2: 0,
              user_id: paul.id,
              match_id: match6.id,
              checked: false
  Tipp.create team1: 1,
              team2: 3,
              user_id: rainer.id,
              match_id: match6.id,
              checked: false

  match7 = Match.find(7)
  Tipp.create team1: 2,
              team2: 0,
              user_id: mark.id,
              match_id: match7.id,
              checked: false
  Tipp.create team1: 0,
              team2: 0,
              user_id: kai.id,
              match_id: match7.id,
              checked: false
  Tipp.create team1: 1,
              team2: 0,
              user_id: paul.id,
              match_id: match7.id,
              checked: false
  Tipp.create team1: 2,
              team2: 1,
              user_id: rainer.id,
              match_id: match7.id,
              checked: false

  match8 = Match.find(8)
  Tipp.create team1: 0,
              team2: 4,
              user_id: mark.id,
              match_id: match8.id,
              checked: false
  Tipp.create team1: 1,
              team2: 3,
              user_id: kai.id,
              match_id: match8.id,
              checked: false
  Tipp.create team1: 1,
              team2: 5,
              user_id: paul.id,
              match_id: match8.id,
              checked: false
  Tipp.create team1: 0,
              team2: 3,
              user_id: rainer.id,
              match_id: match8.id,
              checked: false

  match9 = Match.find(9)
  Tipp.create team1: 1,
              team2: 3,
              user_id: mark.id,
              match_id: match9.id,
              checked: false
  Tipp.create team1: 0,
              team2: 2,
              user_id: kai.id,
              match_id: match9.id,
              checked: false
  Tipp.create team1: 1,
              team2: 1,
              user_id: paul.id,
              match_id: match9.id,
              checked: false
  Tipp.create team1: 1,
              team2: 2,
              user_id: rainer.id,
              match_id: match9.id,
              checked: false
end

#
#------------------------------------------------------------------------------------------------------------
#

desc "Reset all tipps"
task :reset => :environment do
  Tipp.all.each do |t|
    t.checked = false
    t.save
  end
  puts "Tipps reset complete"

  User.all.each do |u|
    u.points = 0
    u.save
  end
  puts "User reset complete"

  Team.all.each do |t|
    t.points = 0
    t.save
  end
  puts "Team reset complete"

  Match.all.each do |m|
    m.evaluated = 0
    m.save
  end
  puts "Team reset complete"

  s = Setting.first
  s.last_change = DateTime.now - 1.month
  s.save

  Rake::Task["webservice:update"].invoke
end

desc "Creates the DB and fill with some demo data"
task :init do
  Rake::Task["db:create"].invoke
  Rake::Task["db:migrate"].invoke
  Rake::Task["db:seed"].invoke
  Rake::Task["webservice:new"].invoke
  Rake::Task["webservice:tipp"].invoke
  Rake::Task["webservice:update"].invoke
end

def get_connection
  return Savon::Client.new("http://www.openligadb.de/Webservices/Sportsdata.asmx?WSDL")
end


def get_settings
  return Setting.first
end

end