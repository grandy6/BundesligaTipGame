class NewsCategory < ActiveRecord::Base
  belongs_to :news
  belongs_to :category
end
