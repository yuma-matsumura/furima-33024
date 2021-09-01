require 'rails_helper'

RSpec.describe PurchaseForm, type: :model do
  before do
    @purchase = FactoryBot.build(:purchase_form)
  end

  describe '商品の購入' do
    context '商品購入がうまくいく場合' do
      it 'FactoryBotが機能している場合' do
        expect(@purchase).to be_valid
      end
    end

    context '商品の購入がうまくできない場合' do
      it '郵便番号が空では保存できない' do
        @purchase.postal_code = ''
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'tokenが空では保存できない' do
        @purchase.token = nil
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Token can't be blank")
      end
      it '都道府県が空では保存できない' do
        @purchase.shipping_area_id = 1
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Shipping area can't be blank")
      end
      it '市区町村が空では保存できない' do
        @purchase.city = ''
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("City can't be blank")
      end
      it '番地が空では保存できない' do
        @purchase.house_number = ''
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("House number can't be blank")
      end
      it '電話番号が空では保存できない' do
        @purchase.telephone_number = ''
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Telephone number can't be blank")
      end

      it '郵便番号に-がない場合保存できない' do
        @purchase.postal_code = '3334444'
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include('Postal code is invalid')
      end

      it '電話番号が12桁の場合保存できない' do
        @purchase.telephone_number = '111111111111'
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include('Telephone number is invalid')
      end

      it '電話番号に-がある場合保存できない' do
        @purchase.telephone_number = '1-1'
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include('Telephone number is invalid')
      end
    end
  end
end
