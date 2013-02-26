class Tipp < ActiveRecord::Base
  attr_accessible :points, :team1, :team2, :user_id, :match_id, :checked

  belongs_to :user
  belongs_to :match
end
