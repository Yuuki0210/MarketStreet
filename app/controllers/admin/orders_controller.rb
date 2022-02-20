class Admin::OrdersController < ApplicationController
  
  before_action :authenticate_manager!

  def index
    if params[:id]
      @orders = User.find(params[:id]).orders.page(params[:page]).per(10).reverse_order
    else
      @orders = Order.page(params[:page]).per(10).reverse_order

    end
  end

  def show
    @order = Order.find(params[:id])
    @order_items = OrderItem.where(order_id: params[:id])
  end

  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    redirect_to admin_order_path
  end

  private

  def order_params
    params.require(:order).permit(:status)
  end
end
