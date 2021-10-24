class Customer::ItemsController < ApplicationController

  def index
    @items = Item.where(is_active: 1).page(params[:page]).per(8)
  end

  def show
    @cart_item = CartItem.new
    @item = Item.find(params[:id])
    @number = 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
  end

end
