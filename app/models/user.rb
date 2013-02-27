class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :token_authenticatable,
  # :lockable, :timeoutable, :omniauthable, :confirmable,
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :username, :firstname, :lastname, :birthday, :role_ids
  
  # validates_uniqueness_of :username

  belongs_to :team
  has_many :tipps
  has_many :user_messages
  has_many :messages, :through => :user_messages
  has_many :news

  before_create :set_default_role

  private
  def set_default_role
    self.roles ||= Role.find_by_name('user')
  end

end
