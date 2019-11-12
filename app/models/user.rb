class User < ApplicationRecord
  has_many :messages, dependent: :destroy
  has_many :user_chats, dependent: :destroy
  has_many :chats, through: :user_chats
end
