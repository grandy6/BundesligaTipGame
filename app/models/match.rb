class Match < ActiveRecord::Base
  attr_accessible :group_id, :group_name, :group_order_id, :icon_url_team1, :icon_url_team2, :id_team1, :id_team2, :last_update, :league_id, :league_name, :league_saison, :league_shortcut, :match_date_time, :match_date_time_utc, :match_is_finished, :match_number, :name_team2, :name_team1, :points_team1, :points_team2, :time_zone_id
  validates_uniqueness_of :match_number

  has_many :tipps
end
