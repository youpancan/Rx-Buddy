class ChangePharmacyLocationToUsers < ActiveRecord::Migration[7.0]
  def change
    change_column :users, :pharmacy_location, :text
  end
end
