class Message < ApplicationRecord
  # automatically created associations
  belongs_to :chatroom
  belongs_to :user
end
