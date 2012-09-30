class CreateCorporations < ActiveRecord::Migration
  def change
    create_table :corporations do |t|
      t.string      :name,    :null => false

      t.timestamps
    end

    add_index :corporations, :name, :unique => true
  end
end
