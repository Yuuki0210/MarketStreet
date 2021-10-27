class Customer::HomesController < ApplicationController

  def top
    @items = Item.where(is_active: 1)
    @random = Item.where(is_active: 1).order("RANDOM()").limit(5)
  end

  def about
  end

end
