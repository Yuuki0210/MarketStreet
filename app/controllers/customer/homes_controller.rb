class Customer::HomesController < ApplicationController

  def top
    @items = Item.where(is_active: 1)
    
  end

  def about
  end

end
