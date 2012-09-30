class CreateAlts < ActiveRecord::Migration
  def change
    create_table :alts do |t|
      t.integer     :pilot_1_id,    :null => false
      t.integer     :pilot_2_id,    :null => false

      t.timestamps
    end

    add_index :alts, [:pilot_1_id, :pilot_2_id], :unique => true
  end
end
