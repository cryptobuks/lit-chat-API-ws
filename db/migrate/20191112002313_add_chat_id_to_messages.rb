class AddChatIdToMessages < ActiveRecord::Migration[6.0]
  def change
    add_column :messages, :chat_id, :integer
  end
end
