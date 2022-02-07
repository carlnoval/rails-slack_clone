class MessagesController < ApplicationController
  def create
    # :chatroom_id can be found right away from routes path column
    @chatroom = Chatroom.find(params[:chatroom_id])
    @message = Message.new(message_params)
    @message.chatroom = @chatroom
    @message.user = current_user

    if @message.save
      redirect_to chatroom_path(@chatroom)
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
