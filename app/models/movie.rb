class Movie < ActiveRecord::Base
	has_and_belongs_to_many :lists
	acts_as_commentable

	scope :tv_shows, -> { where(format: "tv_show") }
	scope :films,    -> { where(format: "film") }
end
