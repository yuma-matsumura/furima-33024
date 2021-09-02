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
        expect(@item.errors.full_messages).to include("画像を入力してください")
      end
      it '商品名が空では登録できない' do
        @item.product_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("商品名を入力してください")
      end
      it '商品の説明が空では登録できない' do
        @item.text = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の説明を入力してください")
      end
      it 'カテゴリー情報が空では登録できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("カテゴリーを選択してください")
      end
      it '商品の状態についての情報が空では登録できない' do
        @item.product_condition_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の状態を選択してください")
      end
      it '送料の負担についての情報が空では登録できない' do
        @item.shipping_charge_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("配送料の負担を選択してください")
      end
      it '発送元の地域についての情報が空では登録できない' do
        @item.shipping_area_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("発送先の地域を選択してください")
      end
      it '発送までの日数についての情報が空では登録できない' do
        @item.delivery_time_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("発送までの日数を選択してください")
      end
      it '価格についての情報が空では登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("価格を入力してください")
      end
      it '価格が¥299の場合登録できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('価格は一覧にありません')
      end
      it '価格が¥10,000,000の場合登録できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('価格は一覧にありません')
      end
      it '価格が英字の場合登録できない' do
        @item.price = 'A'
        @item.valid?
        expect(@item.errors.full_messages).to include('価格は一覧にありません')
      end
      it '価格が全角数字の場合登録できない' do
        @item.price = '１'
        @item.valid?
        expect(@item.errors.full_messages).to include('価格は一覧にありません')
      end
      it '価格がひらがなの場合登録できない' do
        @item.price = 'あ'
        @item.valid?
        expect(@item.errors.full_messages).to include('価格は一覧にありません')
      end
      it '価格が全角かなの場合登録できない' do
        @item.price = 'ア'
        @item.valid?
        expect(@item.errors.full_messages).to include('価格は一覧にありません')
      end
      it '価格が半角かなの場合登録できない' do
        @item.price = 'ｱ'
        @item.valid?
        expect(@item.errors.full_messages).to include('価格は一覧にありません')
      end
      it 'カテゴリー情報が---の場合登録できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("カテゴリーを選択してください")
      end
      it '商品の状態についての情報が---の場合登録できない' do
        @item.product_condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の状態を選択してください")
      end
      it '送料の負担についての情報が---の場合登録できない' do
        @item.shipping_charge_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("配送料の負担を選択してください")
      end
      it '発送元の地域についての情報が---の場合登録できない' do
        @item.shipping_area_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("発送先の地域を選択してください")
      end
      it '発送までの日数についての情報が---の場合登録できない' do
        @item.delivery_time_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("発送までの日数を選択してください")
      end
      it 'userが紐付いていなければ登録できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Userを入力してください')
      end
    end
  end
end
