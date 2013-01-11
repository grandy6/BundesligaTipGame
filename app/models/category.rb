class Category < ActiveRecord::Base
  has_many :news_categories
  has_many :categories, through: :news_categories
end
