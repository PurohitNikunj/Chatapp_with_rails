class User < ApplicationRecord
    has_secure_password
    validates :username, :password, presence: true
    validates :password, confirmation: true
    has_many :messages, dependent: :destroy
    has_many :chat_rooms, through: :room_users
    has_many :room_users
end
