class AddKnownAltsToPilots < ActiveRecord::Migration
  def change
    add_column :pilots, :known_alts, :text
  end
end
