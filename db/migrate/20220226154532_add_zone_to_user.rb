class AddZoneToUser < ActiveRecord::Migration[7.0]
  def change
    add_reference :users, :zone, null: true, foreign_key: true
  end
end
