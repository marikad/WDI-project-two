class User < ActiveRecord::Base
  acts_as_voter
	has_many :lists

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :username, presence: true

  before_create :assign_role
  after_create :create_already_watched
  after_create :create_want_to_watch

  def assign_role
  	self.role = "user" if self.role.blank?
  end

  def create_already_watched
    self.lists.create!(title: "Already Watched", description: "Films you have watched.")
  end

  def create_want_to_watch
    self.lists.create!(title: "Want to Watch", description: "Films you want to watch.")
  end
end
