class AddCreatorAndUpdaterToDisease < ActiveRecord::Migration[7.0]
  def change
    add_column :diseases, :creator, :string
    add_column :diseases, :updater, :string
  end
end
