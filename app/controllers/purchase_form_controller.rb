class PurchaseFormController < ApplicationController
  def index
  end

  def create
    @purchase = PurchaseForm.new(set_params)
    if @purchase.valid?
       @purchase.save
    end

  end

  private
  def set_params
    params.permit(:user_id, :item_id, :order_id, :postal_code, :shipping_area_id, :city, :house_number, :building_name, :telephone_number)
  end
end