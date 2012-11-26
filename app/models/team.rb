class Team < ActiveRecord::Base
  attr_accessible :name, :owner_id
  validates :name, presence: true
  validates_uniqueness_of :name
end
