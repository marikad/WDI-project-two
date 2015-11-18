class List < ActiveRecord::Base
  belongs_to :user, dependent: :destroy
  has_many :movies, through: :list_movies
  has_and_belongs_to_many :movies
  acts_as_commentable
end
