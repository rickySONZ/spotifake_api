class LikedSong < ApplicationRecord
    belongs_to :song
    belongs_to :library
end
