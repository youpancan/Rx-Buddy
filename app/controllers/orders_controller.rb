class OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
  end

  def index
    @orders = Order.where(user: current_user)
  end

  def create
    @order = Order.new(user: current_user)
    @order.refills = current_user.no_order_refills
    if @order.save
      flash[:notice] = "Thank you for your order."
      redirect_to dashboard_path
    else
      redirect_to root_path
    end
  end
end
