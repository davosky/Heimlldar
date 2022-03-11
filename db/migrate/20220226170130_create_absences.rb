class CreateAbsences < ActiveRecord::Migration[7.0]
  def change
    create_table :absences do |t|
      t.integer :name
      t.date :start_time
      t.date :end_time
      t.references :user, null: true, foreign_key: true
      t.text :description

      t.timestamps
    end
  end
end
