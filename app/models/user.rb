class User < ApplicationRecord
    has_secure_password
    has_many :messages, dependent: :destroy
    validates :username, :password, presence: true
    validates :password, confirmation: true
end
