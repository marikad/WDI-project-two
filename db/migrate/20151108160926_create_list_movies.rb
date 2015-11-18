class CreateListMovies < ActiveRecord::Migration
  def change
    create_table :list_movies do |t|
    	t.belongs_to :lists, index: true
    	t.belongs_to :movies, index: true
      t.timestamps null: false
    end
  end
end
