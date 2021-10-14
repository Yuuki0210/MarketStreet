class Customer::CartItemsController < ApplicationController

  def index
    @cart_items = CartItem.where(customer_id: current_customer)
    @number = 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
  end

  def create
    @cart_item = CartItem.new(cart_item_params)
    @cart_items = CartItem.where(customer_id: current_customer)
    @cart_items.each do |cart_item|
      if cart_item.item.id == @cart_item.item_id
        new_piece = cart_item.piece + @cart_item.piece
        cart_item.update_attribute(:piece, new_piece)
        @cart_item.delete
      end
    end
    @cart_item.save
    redirect_to cart_items_path
  end

  def update
  end

  def destroy
  end

  def all_destroy
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:item_id, :customer_id, :piece)
  end
end
