class RemoveListIdFromMovie < ActiveRecord::Migration
  def change
  	remove_column :movies, :movie_id, :integer
  end
end
