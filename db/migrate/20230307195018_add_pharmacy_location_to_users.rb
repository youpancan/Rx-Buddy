class AddPharmacyLocationToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :pharmacy_location, :string
  end
end
