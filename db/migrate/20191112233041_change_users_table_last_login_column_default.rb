class ChangeUsersTableLastLoginColumnDefault < ActiveRecord::Migration[6.0]
  def up
    change_column :users, :last_login, :datetime, :default => Time.now
  end
  def down
    change_column :users, :last_login, :datetime
  end
end
