class HomesController < ApplicationController

    def chatroom
        @all_messages = Message.all
        @message = current_user.messages.new()
    end

end
