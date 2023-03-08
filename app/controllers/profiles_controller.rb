class ProfilesController < ApplicationController

  def edit
    @user = User.new
  end
  def dashboard
    @active_meds = []
    @user = current_user
    # @user_pharmacy_location = current_user.pharmacy_location
    current_user.user_medications.each do |medication|
      @active_meds.push(medication) if medication.number_refills.positive?
    end

    end
end
