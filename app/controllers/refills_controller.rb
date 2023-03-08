class RefillsController < ApplicationController
  def create
    @refill = Refill.new(refill_params)
    @user_medication = UserMedication.find(params[:user_medication_id])
    @refill.user_medication = @user_medication
    @refill.save
  end

  def update
    @refill = Refill.find(params[:id])
    @refill.update(refill_params)
    @refill.save
  end

  private

  def refill_params
    params.require(:refill).permit(:urgency)
  end
end
