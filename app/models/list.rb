class List < ActiveRecord::Base
  belongs_to :user
  has_and_belongs_to_many :movies
  acts_as_commentable
end
