class CreateUserAllergies < ActiveRecord::Migration[7.0]
  def change
    create_table :user_allergies do |t|
      t.references :user, null: false, foreign_key: true
      t.references :allergy, null: false, foreign_key: true
      t.string :severity

      t.timestamps
    end
  end
end
