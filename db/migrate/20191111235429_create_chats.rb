class CreateChats < ActiveRecord::Migration[6.0]
  def change
    create_table :chats do |t|
      t.string :chat_type
      t.integer :host_id, default: nil
      t.string :name, default: nil
      t.string :description, default: nil
    end
  end
end
