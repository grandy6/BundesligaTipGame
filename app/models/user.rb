class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable,
  # :lockable, :timeoutable, :omniauthable, :confirmable,
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :username, :firstname, :lastname, :birthday, :roles

  #Paperclip Konfiguration
 # has_attached_file :avatar, :styles => { :small  => "100x100>", :thumb => "50x50>"}
 # validates_uniqueness_of :username

  belongs_to :team
  has_many :tipps
  has_and_belongs_to_many :roles
  has_many :user_messages
  has_many :messages, :through => :user_messages
  def role?(role)
    self.roles.exists?(:name => role.to_s)
  end
  has_many :news
end
    
