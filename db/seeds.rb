# ruby encoding: utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Setting.create league_id: 456, 
								league_short: "bl1", 
								league_saison: "2012", 
								last_change: DateTime.now - 1.month, 
								color_body: "#555555", 
								color_input: "#777777", 
								color_input_border: "#c7d0d2", 
								color_input_shadow: "#f5f7f8", 
								color_input_border_hover: "#b6bfc0", 
								color_input_shadow_hover: "#f5f7f8", 
								color_input_border_focus: "#A8E4AD", 
								color_input_shadow_focus: "#E7FBEA", 
								color_input_submit: "#ffffff",
								color_input_submit_background_top: "#AEEEB2",
								color_input_submit_background_bottom: "#6DE970",
								color_input_submit_background_hover: "#B9FFB6",
								color_title: "#31B404",
								color_main: "#AAAAAA",
								color_main_h2: "#888888",
								color_main_h3: "#CCCCCC",
								color_notice_background: "#D8F6CE",
								color_alert_background: "#F6CECE"



Quote.create title: 'Alles andere als die Nicht-Meisterschaft wäre ja eine Katastrophe gewesen.', author: 'Thomas Strunz'
Quote.create title: 'Mailand oder Madrid - Hauptsache Italien.', author: 'Andreas Möller'
Quote.create title: 'Zu 50% haben wir es geschafft, aber die halbe Miete ist das noch nicht.', author: 'Rudi Völler'
Quote.create title: 'Wenn der Olli Kahn aufs Feld läuft, ruft Ottmar Hitzfeld vom Rand "Der tut nix, der will nur spielen..."', author: 'Harald Schmidt'
Quote.create title: 'Mann, wir Schwarzen müssen doch zusammenhalten!', author: 'Anthony Baffoe (nach gelber Karte zum Schiri)'
Quote.create title: 'Die Schweden sind keine Holländer - das hat man ganz genau gesehen.', author: 'Franz Beckenbauer'
Quote.create title: 'Eigentlich bin ich ein Supertyp. Aber ich kann wohl auch ein richtiger Arsch sein.', author: 'Mario Basler'
Quote.create title: 'Da kam dann das Elfmeterschießen. Wir hatten alle die Hosen voll, aber bei mir lief\'s ganz flüssig.', author: 'Paul Breitner'
Quote.create title: 'Wer in Bochum von Strafraum zu Strafraum geht und sich dabei nicht den Knöchel bricht, dem gebe ich einen aus.', author: 'Christoph Daum'
Quote.create title: 'Es war ein wunderschöner Augenblick, als der Bundestrainer sagte: "Komm Stefan, zieh deine Sachen aus, jetzt geht\'s los."', author: 'Steffen Freund'
Quote.create title: 'Ich mache nie Voraussagen und werde das auch niemals tun.', author: 'Paul Gascoigne'
Quote.create title: 'Wir wollten in Bremen kein Gegentor kassieren. Das hat auch bis zum Gegentor ganz gut geklappt.', author: 'Thomas Häßler'
Quote.create title: 'Ich habe ihn ausgewechselt, weil ich einen anderen Spieler einwechseln wollte. Da mußte ich einen auswechseln.', author: 'Ewald Lienen'
Quote.create title: 'Wir dürfen jetzt nur nicht den Sand in den Kopf stecken.', author: 'Lothar Matthäus'
Quote.create title: 'Mein Problem ist, daß ich immer sehr selbstkritisch bin, auch mir selbst gegenüber.', author: 'Andreas Möller'

admin_role = Role.create name: 'admin'
user_role = Role.create name: 'user'

Category.create name: "1. Bundesliga 2012/2013"
Category.create name: "2. Bundesliga 2012/2013"

Category.create name: "NFL 2012/2013"
Category.create name: "GFL 2013"
Category.create name: "GFL 2 2013"

admin = User.create :firstname => 'Max', 
						:lastname => 'Mustermann', 
						:username => 'admin', 
						:email => 'admin@example.com', 
						:password => 'password', 
						:password_confirmation => 'password'

admin.roles << admin_role
admin.save

mark = User.create firstname: 'Mark', 
						lastname: 'Matzner', 
						username: 'mark', 
						email: 'mark@example.com', 
						password: 'password', 
						password_confirmation: 'password'
mark.roles << user_role
mark.save

kai = User.create firstname: 'Kai', 
						lastname: 'Starke', 
						username: 'kai', 
						email: 'kai@example.com', 
						password: 'password', 
						password_confirmation: 'password'
kai.roles << user_role
kai.save

paul = User.create firstname: 'Paul', 
						lastname: 'Gralla', 
						username: 'paul', 
						email: 'paul@example.com', 
						password: 'password', 
						password_confirmation: 'password'
paul.roles << user_role
paul.save

rainer = User.create firstname: 'Rainer', 
						lastname: 'Bönning', 
						username: 'rainer', 
						email: 'rainer@example.com', 
						password: 'password', 
						password_confirmation: 'password'
rainer.roles << user_role
rainer.save

team1 = Team.create name: "Die Kickers",
										owner_id: mark.id,
										is_public: true

mark.team = team1
mark.save

kai.team = team1
kai.save

paul.team = team1
paul.save

team2 = Team.create name: "Siegertypen",
										owner_id: rainer.id,
										is_public: true

rainer.team = team2
rainer.save


# #---------- Ab hier beginnen die Seeds für die Tipps ----------

# mark = User.find_by_username('mark')
# kai = User.find_by_username('thomas')
# paul = User.find_by_username('paul')
# rainer = User.find_by_username('rainer')

# match1 = Match.find(1)
# Tipp.create team1: 2,
# 						team2: 4,
# 						user_id: mark.id,
# 						match_id: match1.id,
# 						checked: false
# Tipp.create team1: 3,
# 						team2: 1,
# 						user_id: kai.id,
# 						match_id: match1.id,
# 						checked: false
# Tipp.create team1: 2,
# 						team2: 0,
# 						user_id: paul.id,
# 						match_id: match1.id,
# 						checked: false
# Tipp.create team1: 1,
# 						team2: 1,
# 						user_id: rainer.id,
# 						match_id: match1.id,
# 						checked: false

# match2 = Match.find(2)
# Tipp.create team1: 5,
# 						team2: 0,
# 						user_id: mark.id,
# 						match_id: match2.id,
# 						checked: false
# Tipp.create team1: 2,
# 						team2: 2,
# 						user_id: kai.id,
# 						match_id: match2.id,
# 						checked: false
# Tipp.create team1: 3,
# 						team2: 0,
# 						user_id: paul.id,
# 						match_id: match2.id,
# 						checked: false
# Tipp.create team1: 3,
# 						team2: 1,
# 						user_id: rainer.id,
# 						match_id: match2.id,
# 						checked: false

# match3 = Match.find(3)
# Tipp.create team1: 2,
# 						team2: 1,
# 						user_id: mark.id,
# 						match_id: match3.id,
# 						checked: false
# Tipp.create team1: 2,
# 						team2: 1,
# 						user_id: kai.id,
# 						match_id: match3.id,
# 						checked: false
# Tipp.create team1: 1,
# 						team2: 2,
# 						user_id: paul.id,
# 						match_id: match3.id,
# 						checked: false
# Tipp.create team1: 2,
# 						team2: 1,
# 						user_id: rainer.id,
# 						match_id: match3.id,
# 						checked: false

# match4 = Match.find(4)
# Tipp.create team1: 2,
# 						team2: 1,
# 						user_id: mark.id,
# 						match_id: match4.id,
# 						checked: false
# Tipp.create team1: 0,
# 						team2: 1,
# 						user_id: kai.id,
# 						match_id: match4.id,
# 						checked: false
# Tipp.create team1: 2,
# 						team2: 2,
# 						user_id: paul.id,
# 						match_id: match4.id,
# 						checked: false
# Tipp.create team1: 3,
# 						team2: 1,
# 						user_id: rainer.id,
# 						match_id: match4.id,
# 						checked: false

# match5 = Match.find(5)
# Tipp.create team1: 0,
# 						team2: 1,
# 						user_id: mark.id,
# 						match_id: match5.id,
# 						checked: false
# Tipp.create team1: 2,
# 						team2: 0,
# 						user_id: kai.id,
# 						match_id: match5.id,
# 						checked: false
# Tipp.create team1: 1,
# 						team2: 1,
# 						user_id: paul.id,
# 						match_id: match5.id,
# 						checked: false
# Tipp.create team1: 2,
# 						team2: 1,
# 						user_id: rainer.id,
# 						match_id: match5.id,
# 						checked: false

# match6 = Match.find(6)
# Tipp.create team1: 0,
# 						team2: 1,
# 						user_id: mark.id,
# 						match_id: match6.id,
# 						checked: false
# Tipp.create team1: 0,
# 						team2: 2,
# 						user_id: kai.id,
# 						match_id: match6.id,
# 						checked: false
# Tipp.create team1: 1,
# 						team2: 0,
# 						user_id: paul.id,
# 						match_id: match6.id,
# 						checked: false
# Tipp.create team1: 1,
# 						team2: 3,
# 						user_id: rainer.id,
# 						match_id: match6.id,
# 						checked: false

# match7 = Match.find(7)
# Tipp.create team1: 2,
# 						team2: 0,
# 						user_id: mark.id,
# 						match_id: match7.id,
# 						checked: false
# Tipp.create team1: 0,
# 						team2: 0,
# 						user_id: kai.id,
# 						match_id: match7.id,
# 						checked: false
# Tipp.create team1: 1,
# 						team2: 0,
# 						user_id: paul.id,
# 						match_id: match7.id,
# 						checked: false
# Tipp.create team1: 2,
# 						team2: 1,
# 						user_id: rainer.id,
# 						match_id: match7.id,
# 						checked: false

# match8 = Match.find(8)
# Tipp.create team1: 0,
# 						team2: 4,
# 						user_id: mark.id,
# 						match_id: match8.id,
# 						checked: false
# Tipp.create team1: 1,
# 						team2: 3,
# 						user_id: kai.id,
# 						match_id: match8.id,
# 						checked: false
# Tipp.create team1: 1,
# 						team2: 5,
# 						user_id: paul.id,
# 						match_id: match8.id,
# 						checked: false
# Tipp.create team1: 0,
# 						team2: 3,
# 						user_id: rainer.id,
# 						match_id: match8.id,
# 						checked: false

# match9 = Match.find(9)
# Tipp.create team1: 1,
# 						team2: 3,
# 						user_id: mark.id,
# 						match_id: match9.id,
# 						checked: false
# Tipp.create team1: 0,
# 						team2: 2,
# 						user_id: kai.id,
# 						match_id: match9.id,
# 						checked: false
# Tipp.create team1: 1,
# 						team2: 1,
# 						user_id: paul.id,
# 						match_id: match9.id,
# 						checked: false
# Tipp.create team1: 1,
# 						team2: 2,
# 						user_id: rainer.id,
# 						match_id: match9.id,
# 						checked: false



