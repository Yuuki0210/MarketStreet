class Admin::ItemsController < ApplicationController

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item = Item.create params.require(:item).permit(:image_id)
    @item.save
    redirect_to admin_items_path
  end

  def index
    @items = Item.all
  end

  def show
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    @item = Item.create params.require(:item).permit(:image_id)
    @item.update
    redirect_to admin_items_path
  end

private

def item_params
  params.require(:item).permit(:name, :image_id, :explanation, :is_active, :price, :genre_id)
end

end
