class CreatePermits < ActiveRecord::Migration[7.0]
  def change
    create_table :permits do |t|
      t.integer :name
      t.date :start_time
      t.date :end_time
      t.references :user, null: true, foreign_key: true
      t.text :description
      t.string :creator
      t.string :updater
      t.boolean :cancelled
      t.boolean :morning, default: false
      t.boolean :afternoon, default: false

      t.timestamps
    end
  end
end
