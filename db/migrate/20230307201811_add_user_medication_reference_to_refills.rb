class AddUserMedicationReferenceToRefills < ActiveRecord::Migration[7.0]
  def change
    add_reference :refills, :user_medication, null: false, foreign_key: true
  end
end
