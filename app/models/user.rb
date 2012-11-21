class User < ActiveRecord::Base
  attr_accessible :birthday, :deleted, :email, :email_verified, :firstname, :lastname, :name, :password, :picture_url, :sex
end
