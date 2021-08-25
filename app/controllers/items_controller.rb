class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @items = Item.all.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end
end

private

def item_params
  params.require(:item).permit(:image, :product_name, :text, :category_id, :product_condition_id, :shipping_charge_id,
                               :shipping_area_id, :delivery_time_id, :price).merge(user_id: current_user.id)
end
