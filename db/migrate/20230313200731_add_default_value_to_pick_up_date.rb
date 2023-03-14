class AddDefaultValueToPickUpDate < ActiveRecord::Migration[7.0]
  def change
    remove_column :refills, :pick_up_date
    add_column :refills, :pick_up_date, :date, null: false, default: -> { "CURRENT_TIMESTAMP + INTERVAL '10 days'" }
  end
end
