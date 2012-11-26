# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
	@setting = Setting.new 
	@setting.league_id = 456
	@setting.league_short = "bl1"
	@setting.league_saison = "2012"
	@setting.last_change = DateTime.now
	@setting.save