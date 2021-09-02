class PurchaseFormController < ApplicationController
  before_action :set_purchase, only: [:index, :create]
  before_action :move_to_signed_in, only: [:index, :create]
  before_action :move_to_top_page, only: [:index, :create]
  before_action :move_to_top_page_sold_out, only: [:index, :create]
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
    redirect_to root_path if @item.order.present?
  end

  def set_params
    params.require(:purchase_form).permit(:postal_code, :shipping_area_id, :city, :house_number, :building_name, :telephone_number).merge(
      token: params[:token], item_id: params[:item_id], user_id: current_user.id
    )
  end

  def set_purchase
    @item = Item.find(params[:item_id])
  end

  def move_to_signed_in
    redirect_to user_session_path unless user_signed_in?
  end

  def move_to_top_page
    redirect_to root_path if current_user == @item.user
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: set_params[:token],
      currency: 'jpy'
    )
  end
end
