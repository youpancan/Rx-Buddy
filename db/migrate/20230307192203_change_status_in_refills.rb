class ChangeStatusInRefills < ActiveRecord::Migration[7.0]
  def change
    change_column :refills, :status, :string
  end
end
