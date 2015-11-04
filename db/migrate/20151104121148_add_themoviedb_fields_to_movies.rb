class AddThemoviedbFieldsToMovies < ActiveRecord::Migration
  def change
  	add_column :movies, :adult, :boolean
  	add_column :movies, :backdrop_path, :string
  	add_column :movies, :genre_ids, :string
  	add_column :movies, :the_movie_db_id, :integer
  	add_column :movies, :original_language, :string
  	add_column :movies, :original_title, :string
  	add_column :movies, :overview, :text
  	add_column :movies, :release_date, :date
  	add_column :movies, :poster_path, :string
  	add_column :movies, :popularity, :decimal
  	add_column :movies, :video, :boolean
  	add_column :movies, :vote_average, :decimal
  	add_column :movies, :vote_count, :integer
  end
end
