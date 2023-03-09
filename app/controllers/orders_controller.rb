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
      redirect_to order_path(@order)
    else
      redirect_to root_path
      #change
    end
  end
end
