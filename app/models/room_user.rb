class RoomUser < ApplicationRecord
  belongs_to :user
  belongs_to :chat_room
  scope :owner, -> { where(status:1) }
end
