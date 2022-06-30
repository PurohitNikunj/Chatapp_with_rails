class HomesController < ApplicationController

    def chatroom
        @all_messages = Message.where(chat_room_id:params[:room_id])
        @message = current_user.messages.new()
    end

end
