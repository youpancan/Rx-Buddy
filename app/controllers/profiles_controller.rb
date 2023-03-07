class ProfilesController < ApplicationController

  def dashboard
    # @user = current_user
    @user_pharamcy_location = current_user.pharmacy_location
    current_user.user_medications.each do |medication|
      @active_meds << medication if medication.number_refills.positive?
    end
  end
end
