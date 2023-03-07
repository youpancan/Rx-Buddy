class ChangeTypeNameInAllergies < ActiveRecord::Migration[7.0]
  def change
    rename_column :allergies, :type, :allergy_type
  end
end
