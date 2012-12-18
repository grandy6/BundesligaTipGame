class News < ActiveRecord::Base
  attr_accessible :content, :title, :category_ids
  has_many :news_categories
  has_many :categories, through: :news_categories
end
