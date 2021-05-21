class Song < ApplicationRecord
    validates :uid, uniqueness: true


    has_many :liked_songs


end
