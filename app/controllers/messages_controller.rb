class MessagesController < ApplicationController
    skip_before_action :not_loggedin

    def create
        @message = current_user.messages.new(message_params)
        if @message.save
            ActionCable.server.broadcast "chatroom_channel_#{params[:chat_room_id]}", 
                {message: all_message_partial_render(@message)}
        else
            @all_messages = Message.all
            render :"homes/chatroom", status: :unprocessable_entity
        end
    end

    private
    def message_params
        params.require(:message).permit(:body)
    end

    def all_message_partial_render(message)
        render(partial:'message', locals: {message: message})
    end
end
