class CreateFavoriteMovies < ActiveRecord::Migration[6.1]
  def change
    create_table :favorite_movies do |t|
      t.integer :movie, {null:  false}
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
    add_index :favorite_movies, [:user_id, :movie], unique: true
  end
end
