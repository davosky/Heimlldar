class AddCancelledToDisease < ActiveRecord::Migration[7.0]
  def change
    add_column :diseases, :cancelled, :boolean
  end
end
