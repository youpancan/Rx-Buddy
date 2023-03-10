class RefillsController < ApplicationController
  def create
    @refill = Refill.new(urgency: params[:urgency])
    @user_medication = UserMedication.find(params[:user_medication_id])
    @refill.user_medication = @user_medication
    if @refill.save
      redirect_to dashboard_path
    else
      render 'user_medications/my_medications', status: :unprocessable_entity
      # check
    end
  end

  def update
    @refill = Refill.find(params[:id])
    @refill.update(urgency: params[:urgency])
    @refill.save
  end

  def review
    @refills = current_user.no_order_refills
  end

  def destroy
    @refill = Refill.find(params[:id])
    @refill.destroy
    redirect_to dashboard_path
  end

  def remove_all
    @refills = current_user.no_order_refills
    @refills.each do |refill|
      refill.destroy if refill.order_id.nil?
    end
  end

  private

  def refill_params
    params.require(:refill).permit(:urgency)
  end
end
