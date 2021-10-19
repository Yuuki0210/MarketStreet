class Customer::OrdersController < ApplicationController

  def new
    @customer = current_customer
    @order = Order.new
  end

  def create
    @customer = current_customer
    @order = Order.new(order_params)
    if @order.save

      @cart_items = CartItem.where(customer_id: current_customer)
        @cart_items.each do |cart_item|
          @order_items = @order.order_items.new
          @order_items.item_id = cart_item.item.id
          @order_items.texed_price = cart_item.item.price*1.1
          @order_items.piece = cart_item.piece
          @order_items.save
          @cart_items.destroy_all
        end
      redirect_to thanks_path
    else
      render :new
    end
  end

  def check
    @customer = current_customer
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.postage = 500
    @cart_items = CartItem.where(customer_id: current_customer.id)

    if params[:order][:address_option] == "0"
      @order.postal_code = @customer.postal_code
      @order.address = @customer.address
      @order.name = @customer.last_name + @customer.first_name
    else
    end

  end

  def thanks
  end

  def index
    @orders = Order.where(customer: current_customer)
  end

  def show
    @order = Order.find(params[:id])
  end

  private

  def order_params
    params.require(:order).permit(:customer_id, :postal_code, :name, :address, :payment_method, :total_amount, :postage, :status)
  end

end
