require 'rails_helper'

RSpec.describe PurchaseForm, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @purchase = FactoryBot.build(:purchase_form,user_id: @user.id,item_id: @item.id)
    sleep(0.3)
  end

  describe '商品の購入' do
    context '商品購入がうまくいく場合' do
      it 'FactoryBotが機能している場合' do
        expect(@purchase).to be_valid
      end
      it 'building_nameが空でも保存できる' do
        @purchase.building_name = ''
        expect(@purchase).to be_valid
      end
    end

    context '商品の購入がうまくできない場合' do
      it 'user_id（購入者）が空だと購入できない' do
        @purchase.user_id = ''
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Userを入力してください")
      end
      it 'item_id（購入者）が空だと購入できない' do
        @purchase.item_id = ''
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Itemを入力してください")
      end
      it '郵便番号が空では保存できない' do
        @purchase.postal_code = ''
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("郵便番号を入力してください")
      end
      it 'tokenが空では保存できない' do
        @purchase.token = nil
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("クレジットカード情報を入力してください")
      end
      it '都道府県が空では保存できない' do
        @purchase.shipping_area_id = ''
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("都道府県を入力してください")
      end
      it '市区町村が空では保存できない' do
        @purchase.city = ''
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("市区町村を入力してください")
      end
      it '番地が空では保存できない' do
        @purchase.house_number = ''
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("番地を入力してください")
      end
      it '電話番号が空では保存できない' do
        @purchase.telephone_number = ''
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("電話番号を入力してください")
      end

      it '郵便番号に-がない場合保存できない' do
        @purchase.postal_code = '3334444'
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include('郵便番号は不正な値です')
      end

      it '電話番号が12桁の場合保存できない' do
        @purchase.telephone_number = '111111111111'
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include('電話番号は不正な値です')
      end

      it '電話番号に-がある場合保存できない' do
        @purchase.telephone_number = '1-1'
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include('電話番号は不正な値です')
      end
    end
  end
end
