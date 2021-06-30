class User < ApplicationRecord
    has_secure_password
    validates :email, presence: true, uniqueness: true

    has_one :library
    has_many :liked_songs, through: :library


end
