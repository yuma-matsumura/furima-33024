class PurchaseFormController < ApplicationController
  before_action :set_purchase, only:[:index, :create]
  before_action :move_to_signed_in, only:[:index, :create]
  def index
    @purchase = PurchaseForm.new
  end

  def create
    @purchase = PurchaseForm.new(set_params)
    if @purchase.valid?
       @purchase.save
       redirect_to root_path
    else
      render :index
    end
  end

  private
  def set_params
    params.permit(:user_id, :item_id, :order_id, :postal_code, :shipping_area_id, :city, :house_number, :building_name, :telephone_number)
  end
  def set_purchase
    @item = Item.find(params[:item_id])
  end
  def move_to_signed_in
    unless user_signed_in?
      redirect_to root_path
  end
end
  def move_to_top
    if current_user == @item.user
      redirect_to root_path
    end
  end
end