class Tipp < ActiveRecord::Base
  attr_accessible :points, :team1, :team2

  belongs_to :user
  belongs_to :match
end
