class ChangeOrderIdNullInRefills < ActiveRecord::Migration[7.0]
  def change
    change_column_null :refills, :order_id, true
    # change_column_null :refills, :order_id, :bigint, null: true
  end
end
