class ProfilesController < ApplicationController
  def show
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def update
    if current_user.update(user_params)
      # check if there are contraindications
      # current_user.check_for_contraaa
      # if statement you do have contrai-indicaitons redierect and show an alert
        @contraindications = current_user.check_for_contraindications
        if @contraindications.nil?
          redirect_to dashboard_show_path
        else
          flash[:alert] = "You are allergic to #{@contraindications.name} please consult your health care provider!"
          redirect_to dashboard_show_path
        end
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def dashboard
    @active_meds = []
    @allergic_meds = []
    @allergies = current_user.allergies
    @medications = current_user.medications
    # @user_pharmacy_location = current_user.pharmacy_location
    current_user.user_medications.each do |medication|
      @active_meds.push(medication) if medication.number_refills.positive?
    end

    @allergies.each do |allergy|
      @medications.each do |med|
        if med.ingredients.split.include?(allergy.allergy_type)
          @allergic_meds << med
        end
      end
    end

    @marker = {
      lat: current_user.latitude,
      lng: current_user.longitude
    }
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :birthday, :phone_number, :address, allergy_ids: [])
  end
end
