class Message < ApplicationRecord
    belongs_to :user
    belongs_to :chat_room
    validates :body, presence: { message: "Message can't be blank!!" }
end
