class CreateAllergies < ActiveRecord::Migration[7.0]
  def change
    create_table :allergies do |t|
      t.string :type

      t.timestamps
    end
  end
end
