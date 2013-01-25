class Role < ActiveRecord::Base
	attr_accessible :name
	has_and_belongs_to_many :users
  validates_uniqueness_of :name
end