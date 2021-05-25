class Song < ApplicationRecord
    validates :uid, uniqueness: true
    has_many :liked_songs

    scope :pull_search_results, ->(p) {where("name LIKE ?", "%#{p}%")}


end
