class MessagesController < ApplicationController
    skip_before_action :not_loggedin

    def create
        @message = current_user.messages.new(message_params)
        if @message.save
            ActionCable.server.broadcast "chatroom_channel", 
                {message: all_message_partial_render(@message)}
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
