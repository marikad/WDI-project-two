class Movie < ActiveRecord::Base
	has_and_belongs_to_many :lists
	acts_as_commentable

	scope :tv_shows, -> { where(format: "tv_show") }
	scope :films,    -> { where(format: "film") }

	  # It returns the articles whose titles contain one or more words that form the query
	  def self.search(query)
	    # where(:title, query) -> This would return an exact match of the query
	    where("title like ?", "%#{query}%") 
	  end
end
