class Chatroom < ApplicationRecord
  # manually added associations
  has_many :messages
  has_many :users
end
