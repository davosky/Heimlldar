class AddCancelledToAbsence < ActiveRecord::Migration[7.0]
  def change
    add_column :absences, :cancelled, :boolean
  end
end
