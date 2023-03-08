class ChangeReferenceInOrders < ActiveRecord::Migration[7.0]
  def change
    remove_column :orders, :user_medication_id, :bigint
    add_reference :orders, :user, null: false, foreign_key: true
  end
end
