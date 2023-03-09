class ProfilesController < ApplicationController
  def show
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    @user.update(user_params)

    if @user.save
      redirect_to dashboard_show_path
    else
      render :edit, status: unprocessable_entity
    end
  end

  def dashboard
    @active_meds = []
    # @user_pharmacy_location = current_user.pharmacy_location
    current_user.user_medications.each do |medication|
      @active_meds.push(medication) if medication.number_refills.positive?
    end
  end

    @marker = {
        lat: current_user.latitude,
        lng: current_user.longitude
    }
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :birthday, :phone_number, :address, )
  end
end
