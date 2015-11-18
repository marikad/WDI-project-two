class Movie < ActiveRecord::Base
	has_and_belongs_to_many :lists
  has_many :lists, through: :list_movies
	acts_as_commentable
  acts_as_votable
	

	scope :tv_shows, -> { where(format: "tv") }
	scope :films,    -> { where(format: "movie") }

  # It returns the articles whose titles contain one or more words that form the query
  # def self.search(query)
  #   # where(:title, query) -> This would return an exact match of the query
  #   where("title like ?", "%#{query}%") 
  # end

  def self.dedupe
    # find all models and group them on keys which should be common
    grouped = all.group_by { |model| [model.poster_path, model.title, model.release_date] }
    grouped.values.each do |duplicates|
      # the first one we want to keep right?
      first_one = duplicates.shift # or pop for last one
      # if there are any more left, they are duplicates
      # so delete all of them
      duplicates.each { |double | double.destroy }
    end
  end
end
