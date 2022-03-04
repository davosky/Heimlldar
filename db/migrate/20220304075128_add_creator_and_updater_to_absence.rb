class AddCreatorAndUpdaterToAbsence < ActiveRecord::Migration[7.0]
  def change
    add_column :absences, :creator, :string
    add_column :absences, :updater, :string
  end
end
