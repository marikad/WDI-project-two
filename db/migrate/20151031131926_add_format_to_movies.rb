class AddFormatToMovies < ActiveRecord::Migration
  def change
    add_column :movies, :format, :string
  end
end
