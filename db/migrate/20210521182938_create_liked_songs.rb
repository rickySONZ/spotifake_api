class CreateLikedSongs < ActiveRecord::Migration[6.1]
  def change
    create_table :liked_songs do |t|
      t.integer :library_id
      t.integer :song_id

      t.timestamps
    end
  end
end
