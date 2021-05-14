require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '商品出品ができるとき' do
      it '全ての記述が存在すれば登録できる' do
        expect(@item).to be_valid
      end
      it 'priceが半角であれば登録できる' do
        @item.price = 300
        expect(@item).to be_valid
      end
    end
    context '商品出品ができないとき' do
      it '商品に紐づくuserが存在しないと登録できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Userを入力してください")
      end
      it 'nameが空では登録できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("商品名を正しく入力してください")
      end
      it 'imageが空では登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("出品画像を正しく入力してください")
      end
      it 'descriptionが空では登録できない' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の説明を正しく入力してください")
      end
      it 'priceが半角英数混合では登録できない' do
        @item.price = '000aaa'
        @item.valid?
        expect(@item.errors.full_messages).to include("販売価格は半角数字で入力してください")
      end
      it 'priceが半角英語だけでは登録できない' do
        @item.price = 'aaaa'
        @item.valid?
        expect(@item.errors.full_messages).to include("販売価格は半角数字で入力してください")
      end
      it 'priceが空では登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("販売価格は半角数字で入力してください")
      end
      it 'priceが半角数字でないと登録できない' do
        @item.price = '００００'
        @item.valid?
        expect(@item.errors.full_messages).to include("販売価格は半角数字で入力してください")
      end
      it 'priceが¥300以下では登録できない' do
        @item.price = 100
        @item.valid?
        expect(@item.errors.full_messages).to include("販売価格は299円より高い値段にしてください")
      end
      it 'priceが¥9,999,999以上では登録できない' do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("販売価格は10000000円より安い値段にしてください")
      end
      it 'categoryが「---」では登録できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("カテゴリーは正しく選択してください")
      end
      it 'statusが「---」では登録できない' do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の状態は正しく選択してください")
      end
      it 'delivery_chargeが「---」では登録できない' do
        @item.delivery_charge_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("配送料の負担は正しく選択してください")
      end
      it 'shipping_areaが「---」では登録できない' do
        @item.shipping_area_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("発送元の地域は正しく選択してください")
      end
      it 'days_to_shipが「---」では登録できない' do
        @item.days_to_ship_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("発送までの日数は正しく選択してください")
      end
    end
  end
end
