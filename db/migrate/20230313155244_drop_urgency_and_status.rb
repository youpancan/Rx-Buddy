class DropUrgencyAndStatus < ActiveRecord::Migration[7.0]
  def change
    remove_column :refills, :urgency
    remove_column :refills, :status
  end
end
