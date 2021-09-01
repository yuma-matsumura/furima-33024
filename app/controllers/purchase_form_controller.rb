class PurchaseFormController < ApplicationController
  before_action :set_purchase, only:[:index, :create]
  before_action :move_to_signed_in, only:[:index, :create]
  before_action :move_to_top_page, only:[:index]
  before_action :move_to_top_page_sold_out, only:[:index]
  def index
    @purchase = PurchaseForm.new
  end

  def create
    @purchase = PurchaseForm.new(set_params)
    if @purchase.valid?
        pay_item
       @purchase.save
       redirect_to root_path
    else
      render :index
    end
  end

  private
  def move_to_top_page_sold_out
    if @item.order.present?
      redirect_to root_path
    end
  end
  def set_params
    params.require(:purchase_form).permit(:postal_code, :shipping_area_id, :city, :house_number, :building_name, :telephone_number).merge(token: params[:token],item_id: params[:item_id],user_id: current_user.id)
  end
  def set_purchase
    @item = Item.find(params[:item_id])
  end
  def move_to_signed_in
    unless user_signed_in?
      redirect_to root_path
    end
  end
  def move_to_top_page
    redirect_to root_path if current_user == @item.user
  end
  def move_to_top
    if current_user == @item.user
      redirect_to root_path
    end
  end
  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
        Payjp::Charge.create(
          amount: @item.price,
          card: set_params[:token],
          currency: 'jpy'
        )
  end
end