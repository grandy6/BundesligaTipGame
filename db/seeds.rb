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
									last_change: DateTime.now, 
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


	Role.create name: 'admin'
	Role.create name: 'user'

	Category.create name: "1. Bundesliga 2012/2013"
	Category.create name: "2. Bundesliga 2012/2013"
	
	Category.create name: "NFL 2012/2013"
	Category.create name: "GFL 2013"
	Category.create name: "GFL 2 2013"
	
	User.create :firstname => 'Max', 
							:lastname => 'Mustermann', 
							:username => 'admin', 
							:email => 'admin@example.com', 
							:password => 'password', 
							:password_confirmation => 'password', 
							:role => '1'	# Role 1 = admin

