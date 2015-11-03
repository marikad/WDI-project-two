class User < ActiveRecord::Base
	has_many :lists

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :username, presence: true

  before_create :assign_role

  def assign_role
  	self.role = "user" if self.role.blank?
  end
end
