class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :username
      t.integer :age
      t.boolean :active
      t.timestamp :last_login
      t.integer :cool_points, default: 0
    end
  end
end
