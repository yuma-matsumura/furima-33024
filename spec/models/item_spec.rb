require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品の出品' do
    context '新規出品がうまくいく場合' do
      it 'FactoryBotが機能している場合' do
        expect(@item).to be_valid
      end
    end

    context '新規出品がうまくいかない場合' do
      it '商品画像が空では登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '商品名が空では登録できない' do
        @item.product_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Product name can't be blank")
      end
      it '商品の説明が空では登録できない' do
        @item.text = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Text can't be blank")
      end
      it 'カテゴリー情報が空では登録できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it '商品の状態についての情報が空では登録できない' do
        @item.product_condition_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Product condition can't be blank")
      end
      it '送料の負担についての情報が空では登録できない' do
        @item.shipping_charge_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping charge can't be blank")
      end
      it '発送元の地域についての情報が空では登録できない' do
        @item.shipping_area_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping area can't be blank")
      end
      it '発送までの日数についての情報が空では登録できない' do
        @item.delivery_time_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery time can't be blank")
      end
      it '価格についての情報が空では登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it '価格が¥299の場合登録できない' do
        @item.price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not included in the list')
      end
      it '価格が¥10,000,000の場合登録できない' do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not included in the list')
      end
      it '価格が英字の場合登録できない' do
        @item.price = 'A'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not included in the list')
      end
      it '価格が全角数字の場合登録できない' do
        @item.price = '１'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not included in the list')
      end
      it '価格がひらがなの場合登録できない' do
        @item.price = 'あ'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not included in the list')
      end
      it '価格が全角かなの場合登録できない' do
        @item.price = 'ア'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not included in the list')
      end
      it '価格が半角かなの場合登録できない' do
        @item.price = 'ｱ'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not included in the list')
      end
    end
  end
end
