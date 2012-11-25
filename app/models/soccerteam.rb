class Soccerteam < ActiveRecord::Base
  attr_accessible :team_icon_url, :team_name, :team_number
  validates_uniqueness_of :team_number
end
