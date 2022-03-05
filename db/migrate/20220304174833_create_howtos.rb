class CreateHowtos < ActiveRecord::Migration[7.0]
  def change
    create_table :howtos do |t|
      t.string :name
      t.references :topic, null: false, foreign_key: true
      t.text :description

      t.timestamps
    end
  end
end
