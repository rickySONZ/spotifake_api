class User < ApplicationRecord
    has_secure_password
    validates :email, presence: true, uniqueness: true
    validates_format_of :email,:with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/

    has_one :library
    has_many :liked_songs, through: :library


end
