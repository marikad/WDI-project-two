class RemoveMovieIdFromLists < ActiveRecord::Migration
  def change
  	remove_column :lists, :movie_id
  end
end
