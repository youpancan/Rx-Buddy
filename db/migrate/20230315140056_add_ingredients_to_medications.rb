class AddIngredientsToMedications < ActiveRecord::Migration[7.0]
  def change
    add_column :medications, :ingredients, :text
  end
end
