class ChatroomChannel < ApplicationCable::Channel
  def subscribed
    # subscribing to a channel happens when user lands on the page

    # not coming from url, comming from consumer.subscriptions.create({ channel: "ChatroomChannel", id: id }
    chatroom = Chatroom.find(params[:id])
    # generating a unique name for `chatroom` 
    stream_for chatroom

    # if one channel for entire website
    # stream_for "general"
  end

  # when someon leaves the channel, something happens, not doing this for the demo
  # def unsubscribed
  #   # Any cleanup needed when channel is unsubscribed
  # end
end
