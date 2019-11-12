class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|
      t.integer :user_id
      t.string :content
      t.string :status, default: 'sent'
      t.timestamp :time_read, default: nil
    end
  end
end
