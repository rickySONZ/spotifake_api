class Library < ApplicationRecord
    belongs_to :user
    has_many :liked_songs
    has_many :songs, through: :liked_songs

    def song_ids=(arr)
        arr.each do |id|
            self.liked_songs.build(song_id: id) unless LikedSong.find_by(song_id: id, library_id: self.id)
        end
    end
end
