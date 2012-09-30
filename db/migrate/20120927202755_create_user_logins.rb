class CreateUserLogins < ActiveRecord::Migration
  def change
    create_table :user_logins do |t|
      t.integer     :user_id,     :null => false
      t.string      :ip_address
      t.string      :url

      t.timestamps
    end

    add_index :user_logins, :user_id
  end
end
