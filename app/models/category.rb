class Category < ActiveRecord::Base
  attr_accessible :name
  has_many :news_categories
  has_many :categories, through: :news_categories
end
