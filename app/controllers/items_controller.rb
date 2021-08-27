class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]
  before_action :set_item, only: [:show, :edit, :update]
  before_action :move_to_top, only: [:edit]

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


  def show
  end

  def edit
  end

  def update
    @item.update(item_params)
     if @item.save
      redirect_to item_path
     else
      render :edit
     end
  end


private

def item_params
  params.require(:item).permit(:image, :product_name, :text, :category_id, :product_condition_id, :shipping_charge_id,
                               :shipping_area_id, :delivery_time_id, :price).merge(user_id: current_user.id)
end

def set_item
  @item = Item.find(params[:id])
end

def move_to_top
  redirect_to root_path unless current_user == @item.user
end

end