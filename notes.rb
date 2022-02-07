# Executed rails command after creating the app from scratch
# rails g migration AddNicknameToUsers nickname
# rails g model Chatroom name
# rails g model Message content chatroom:references user:references
# rails db:migrate

# rails g controller chatrooms

# Users created:
# User.create(email: "carl@email.com", nickname: "carl1", password: "123456")
# User.create(email: "rcarl@email.com", nickname: "carl2", password: "123456")

# rails g controller messages

# rails g channel Chatroom
# convention: rails g channel ChannelName
# invoke  test_unit
# create    test/channels/chatroom_channel_test.rb
# create  app/channels/chatroom_channel.rb