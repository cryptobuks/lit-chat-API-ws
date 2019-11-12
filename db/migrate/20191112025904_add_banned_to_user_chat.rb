class AddBannedToUserChat < ActiveRecord::Migration[6.0]
  def change
    add_column :user_chats, :banned, :boolean
  end
end
