class AddColorToUser < ActiveRecord::Migration[7.0]
  def change
    add_reference :users, :color, null: false, foreign_key: true
  end
end
