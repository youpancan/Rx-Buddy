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
    @refill = Refill.find(params[:id])
    @user = @refill.user_medication.user
    @order = @refill.order
    @sum = 0
    @order_meds = []
    case params[:refill][:status].to_i
    when 0
      @refill.pending!
    when 1
      @refill.received!
    when 2
      @refill.in_process!
      # broadcast and redirect can not operate at the same time
      # redirect_to order_path(@refill.order)
    when 3
      @refill.complete!
      @sum += 1
      @message = ""
      @message = "your #{@refill.user_medication.medication.name} is ready for pick up!"
    end
    if @sum == @order.refills.count
       @message = "your order is ready to pick up! "
    end
    @notification = Notification.new(refill: @refill, message: @message)
    if @notification.save
      UserChannel.broadcast_to(
        @user,
        @notification.message
      )
      head :ok
    end
  end

  private

  def refill_params
    params.require(:refill).permit(:urgency)
  end
end
