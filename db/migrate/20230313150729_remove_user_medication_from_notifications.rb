class RemoveUserMedicationFromNotifications < ActiveRecord::Migration[7.0]
  def change
    remove_reference :notifications, :user_medication, null: false, foreign_key: true, index: true
  end
end
