class UserMedicationsController < ApplicationController
  def my_medications
    @user_medications = UserMedication.where(user: current_user)
    # @user_medications.user = current_user
  end
end
