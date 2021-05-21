class Library < ApplicationRecord
    belongs_to :user
    has_many :liked_songs
    has_many :songs, through: :liked_songs

end
