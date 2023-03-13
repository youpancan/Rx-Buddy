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
    redirect_to review_path
  end

  def review
    @refills = current_user.no_order_refills
  end

  def destroy
    @refill = Refill.find(params[:id])
    @refill.destroy
    if current_user.no_order_refills == []
      redirect_to dashboard_path
    else
      redirect_to review_path
    end
  end

  def remove_all
    @refills = current_user.no_order_refills
    @refills.each do |refill|
      refill.destroy
    end
    flash[:notice] = "Order cancelled"
    redirect_to dashboard_path
  end

  def pharmacy_edit
    @refill = Refill.find(params[:id])
  end

  def pharmacy_update
    raise
    @refill = Refill.find(params[:id])

  end

  private

  def refill_params
    params.require(:refill).permit(:urgency)
  end
end
