class CreateAbsences < ActiveRecord::Migration[7.0]
  def change
    create_table :absences do |t|
      t.integer :name
      t.datetime :start_time
      t.datetime :end_time
      t.references :user, null: true, foreign_key: true
      t.references :absence_type, null: true, foreign_key: true
      t.text :description

      t.timestamps
    end
  end
end
