class NewsCategory < ActiveRecord::Base
  attr_accessible :news, :category
  belongs_to :news
  belongs_to :category
end
