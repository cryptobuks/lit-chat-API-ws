class AddColumnstoUsersTable < ActiveRecord::Migration[6.0]
  def change
    change_table :users do |t|
      t.string :email
      t.string :login_token
      t.datetime :token_generated_at
      t.string :fullname
    end
  end
end


