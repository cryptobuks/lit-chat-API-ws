class ChangeUsersColumnActiveDefault < ActiveRecord::Migration[6.0]
  def up
    change_column :users, :active, :boolean , :default => true
  end
  def down
    change_column :users, :active, :boolean
  end
end
