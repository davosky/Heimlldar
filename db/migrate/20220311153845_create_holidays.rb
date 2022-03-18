class CreateHolidays < ActiveRecord::Migration[7.0]
  def change
    create_table :holidays do |t|
      t.integer :name
      t.datetime :start_time
      t.datetime :end_time
      t.references :user, null: true, foreign_key: true
      t.text :description
      t.string :creator
      t.string :updater
      t.boolean :cancelled

      t.timestamps
    end
  end
end
