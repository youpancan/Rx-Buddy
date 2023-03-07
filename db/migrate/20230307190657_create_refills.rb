class CreateRefills < ActiveRecord::Migration[7.0]
  def change
    create_table :refills do |t|
      t.string :urgency
      t.boolean :status
      t.date :pick_up_date
      t.text :notes
      t.references :order, null: false, foreign_key: true

      t.timestamps
    end
  end
end
