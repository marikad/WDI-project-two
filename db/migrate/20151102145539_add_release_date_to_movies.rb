class AddReleaseDateToMovies < ActiveRecord::Migration
  def change
  	add_column :movies, :realease_date, :string
  end
end
