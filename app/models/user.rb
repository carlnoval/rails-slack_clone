class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  # could also have the association below however messaging apps ...
  # ... don't usually gather user's messages across all chatroom
  # has_many: messages
end
