class UserMedicationsController < ApplicationController
  def my_medications
    @user_medications = UserMedication.where(user: current_user)
    @allergic_meds = allergic_medications
  end

  private

  def allergic_medications
    allergic_meds = []
    allergies = current_user.allergies
    medications = current_user.medications
    allergies.each do |allergy|
      medications.each do |med|
        allergic_meds << med if med.ingredients.split.include?(allergy.allergy_type)
      end
    end
    return allergic_meds
  end
end
