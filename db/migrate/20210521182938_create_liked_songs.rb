class CreateLikedSongs < ActiveRecord::Migration[6.1]
  def change
    create_table :liked_songs do |t|

      t.timestamps
    end
  end
end
