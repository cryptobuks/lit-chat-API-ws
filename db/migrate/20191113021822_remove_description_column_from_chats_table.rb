class RemoveDescriptionColumnFromChatsTable < ActiveRecord::Migration[6.0]
  def up
    remove_column :chats, :description, :string
  end
  def down
    add_column :chats, :description, :string
  end
end
