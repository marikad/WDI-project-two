# admin = User.create!(username: "m-dog", email: "m@m.com", password: "password", first_name: "Marika", last_name: "Devan", role: "admin")
# u1 = User.create!(username: "a-dog", email: "a@a.com", password: "password", first_name: "Alex", last_name: "Chin")
# film = Movie.create!(title: "Inside Out", description: "After young Riley is uprooted from her Midwest life and moved to San Francisco, her emotions - Joy, Fear, Anger, Disgust and Sadness - conflict on how best to navigate a new city, house, and school.", image: "http://ia.media-imdb.com/images/M/MV5BOTgxMDQwMDk0OF5BMl5BanBnXkFtZTgwNjU5OTg2NDE@._V1_SX214_AL_.jpg", format: "film", realease_date: "2015")
# tv_show = Movie.create!(title: "Friends", description: "Follows the lives of six 20-something friends living in Manhattan.", image: "http://ia.media-imdb.com/images/M/MV5BMTg4NzEyNzQ5OF5BMl5BanBnXkFtZTYwNTY3NDg4._V1._CR24,0,293,443_SX214_AL_.jpg", format: "tv_show", realease_date: "1994")

Movie.destroy_all

require "HTTParty"
require "pry"

def save_results(results)
	image_width  = 300
	image_prefix = "https://image.tmdb.org/t/p/w#{image_width}"

	results.each do |movie|
		puts "Saving #{movie['title']}" if movie["title"]
		local_movie 						  = Movie.new
		local_movie.title         = movie["title"] if movie["title"]
		local_movie.description   = movie["overview"] if movie["overview"]
		local_movie.image         = image_prefix + movie["poster_path"] if movie["poster_path"]
		local_movie.format        = "movie"
		local_movie.realease_date = movie["release_date"] if movie["release_date"]
		local_movie.save
		puts "Movie acquired."
	end
end

alphabet     = ("a".."z").to_a
base_uri     = "http://api.themoviedb.org/3/search/movie?query="
api_key      = "&api_key=e289afb7fe5adaeb4a56eb709fc9ebee"

alphabet.each do |letter|
	puts "Seaching for letter: #{letter}"
	response    = HTTParty.get(base_uri+letter+api_key)
	total_pages	= response['total_pages']
	results     = response['results']

	puts "Saving page 1 of #{total_pages}"
	save_results(results)

	2.upto(total_pages) do |page_number|
		puts "Saving page #{page_number} of #{total_pages}"
		response = HTTParty.get(base_uri+letter+api_key+"&page=#{page_number}")
		results  = response['results']
		save_results(results)
		puts "\n\n"
	end
end