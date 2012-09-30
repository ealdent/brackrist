class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string      :login,         :null => false
      t.string      :password,      :null => false
      t.string      :salt,          :null => false

      t.integer     :access_level,  :null => false,   :default => 0

      t.integer     :persistence_token

      t.datetime    :last_login
      t.string      :last_login_ip

      t.timestamps
    end

    add_index :users, :login, :unique => true
    add_index :users, :persistence_token
  end
end
