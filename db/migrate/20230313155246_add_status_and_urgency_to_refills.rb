class AddStatusAndUrgencyToRefills < ActiveRecord::Migration[7.0]
  def change
    add_column :refills, :status, :integer, null: false, default: 0
    add_column :refills, :urgency, :integer, null: false, default: 3
  end
end
