class Chat < ApplicationRecord
  has_many :messages, dependent: :destroy
  has_many :user_chats, dependent: :destroy
  has_many :users, through: :user_chats

  # The validation for chat_type below could be considered over-engineering
  # by some since I am going to be controlling the user input on the front-end
  # by only allowing them to select the chat_type from a dropdown selection input
  # tag. Even though I am controlling the input on the front-end in this way, 
  # I chose to implement this to double-down on controlling user input so that
  # I kept my app working properly even if someone tries to implement a fetch
  # in order to create records.
  validates :chat_type, inclusion: { in: %w(dm pri_group pub_group),
    message: "%{value} is not a proper group type" }, presence: true
  validates :name, length: { maximum: 29, 
    too_long: "Chat name must be less than %{count} characters." },
    presence: true, uniqueness: true
end
