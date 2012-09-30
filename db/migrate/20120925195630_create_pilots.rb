class CreatePilots < ActiveRecord::Migration
  def change
    create_table :pilots do |t|
      t.string      :name,            :null => false
      t.integer     :corporation_id
      t.integer     :user_id
      t.text        :reason

      t.timestamps
    end

    add_index :pilots, :name, :unique => true
    add_index :pilots, :corporation_id
    add_index :pilots, :user_id
  end
end
