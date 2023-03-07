class CreateUserMedications < ActiveRecord::Migration[7.0]
  def change
    create_table :user_medications do |t|
      t.references :medication, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.integer :number_refills
      t.string :prescriber
      t.date :refill_due_date
      t.boolean :refillable

      t.timestamps
    end
  end
end
