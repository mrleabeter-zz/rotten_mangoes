class AddMoviePosterFieldToMovies < ActiveRecord::Migration
  def change
    add_column :movies, :movie_poster, :string
  end
end
