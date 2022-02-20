class Customer::ItemsController < ApplicationController
  
  before_action :move_to_signed_in, except: [:index]

  def index
    @items = Item.where(is_active: 1).page(params[:page]).per(9)
  end

  def show
    @cart_item = CartItem.new
    @item = Item.find(params[:id])
    @number = 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
  end
  
  private
  
  def move_to_signed_in
    unless customer_signed_in?
      redirect_to  new_customer_session_path
    end
  end

end
