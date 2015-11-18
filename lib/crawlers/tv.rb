require "HTTParty"
require "pry"

def save_results(results)
	image_width  = 300
	image_prefix = "https://image.tmdb.org/t/p/w#{image_width}"

	return if !results
	results.each do |tv|
		puts "Saving #{tv['name']}" if tv["name"]
		local_tv 								   = Movie.new
		local_tv.format            = "tv"
		local_tv.title             = tv["name"] if tv["name"]
		local_tv.description       = tv["overview"] if tv["overview"]
		local_tv.image             = image_prefix + tv["poster_path"] if tv["poster_path"]
		local_tv.realease_date     = tv["release_date"] if tv["release_date"]
		local_tv.adult					   = tv["adult"] if tv["adult"]
		local_tv.backdrop_path     = tv["backdrop_path"] if tv["backdrop_path"]
		local_tv.genre_ids         = tv["genre_ids"]*"," if tv["genre_ids"]
		local_tv.the_movie_db_id   = tv["the_movie_db_id"] if tv["the_movie_db_id"]
		local_tv.original_language = tv["original_language"] if tv["original_language"]
		local_tv.original_title    = tv["original_name"] if tv["original_name"]
		local_tv.overview				   = tv["overview"] if tv["overview"]    
		local_tv.poster_path       = tv["poster_path"] if tv["poster_path"]
		local_tv.popularity        = tv["popularity"] if tv["popularity"]
		local_tv.video             = tv["video"] if tv["video"]
		local_tv.vote_average      = tv["vote_average"] if tv["vote_average"]
		local_tv.vote_count        = tv["vote_count"] if tv["vote_count"]
		local_tv.save
		puts "Movie acquired."
	end
end

# alphabet     = ("a".."z").to_a
vowels       = %w(a e i o u)
base_uri     = "http://api.themoviedb.org/3/search/tv?query="
api_key      = "&api_key=e289afb7fe5adaeb4a56eb709fc9ebee"

# alphabet.each do |letter|
vowels.each do |letter|
	puts "Seaching for letter: #{letter}"
	response    = HTTParty.get(base_uri+letter+api_key)
	
	total_pages	= response['total_pages']
	results     = response['results']

	puts "Saving page 1 of #{total_pages}"
	save_results(results)

	# 2.upto(total_pages) do |page_number|
	# 	puts "Saving page #{page_number} of #{total_pages}"
	# 	response = HTTParty.get(base_uri+letter+api_key+"&page=#{page_number}")
	# 	results  = response['results']
	# 	save_results(results) if results
	# 	puts "\n\n"
	# end
end