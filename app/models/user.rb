class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :username, :firstname, :lastname, :birthday
  # attr_accessible :title, :body
  
  validates_uniqueness_of :username
  has_and_belongs_to_many :roles
  def role?(role)
    return !!self.roles.find_by_name(role.to_s.camelize)
end
end
  