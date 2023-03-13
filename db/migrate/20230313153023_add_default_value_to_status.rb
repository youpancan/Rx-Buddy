class AddDefaultValueToStatus < ActiveRecord::Migration[7.0]
  def change
    change_column_default :refills, :status, 0
  end
end
