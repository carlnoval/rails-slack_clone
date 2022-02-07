class MessagesController < ApplicationController
  def create
    # :chatroom_id can be found right away from routes path column
    @chatroom = Chatroom.find(params[:chatroom_id])
    @message = Message.new(message_params)
    @message.chatroom = @chatroom
    @message.user = current_user

    if @message.save
      # send to the channel
      ChatroomChannel.broadcast_to(
        @chatroom,  # instance needed to know which channel/chatroom to broadcast to
        # partial: "message" - referrs to views/messages/_message.html.erb
        render_to_string(partial: "message", locals: { message: @message })
      )

      # anchor - prevents user from being taken to the top of the page after submitting message
      # message-#{@message.id} - can be found on the chatroom show page
      redirect_to chatroom_path(@chatroom, anchor: "message-#{@message.id}")
    else
      # render the view file
      render 'chatrooms/show'
    end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
