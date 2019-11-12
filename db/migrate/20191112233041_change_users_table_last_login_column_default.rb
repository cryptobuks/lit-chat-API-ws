class ChangeUsersTableLastLoginColumnDefault < ActiveRecord::Migration[6.0]
  def change
    change_column :users, :last_login, :datetime, :default => Time.now
  end
end
