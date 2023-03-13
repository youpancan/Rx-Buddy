class ChangeStatusToIntger < ActiveRecord::Migration[7.0]
  def change
    change_column :refills, :status, :integer, using: 'status::integer'
  end
end
