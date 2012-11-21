class User < ActiveRecord::Base
  attr_accessible :birthday, :deleted, :email, :email_verfiied, :firstname, :lastname, :name, :password, :picture_url, :sex
end
