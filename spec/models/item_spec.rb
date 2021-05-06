require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    
    context '商品出品ができないとき' do
      it 'nameが空では登録できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it 'imageが空では登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'descriptionが空では登録できない' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end
      it 'priceが空では登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'priceが半角数字でないと登録できない' do
        @item.price = '００００'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
      it 'priceが¥300~¥9,999,999での間でないと登録できない' do
        @item.price = '100'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than 300")
      end
      it 'categoryが「---」では登録できない' do
        @item.category_id = '---'
        @item.valid?
        expect(@item.errors.full_messages).to include("Category is not a number")
      end
      it 'statusが「---」では登録できない' do
        @item.status_id = '---'
        @item.valid?
        expect(@item.errors.full_messages).to include("Status is not a number")
      end
      it 'delivery_chargeが「---」では登録できない' do
        @item.delivery_charge_id = '---'
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery charge is not a number")
      end
      it 'shipping_areaが「---」では登録できない' do
        @item.shipping_area_id = '---'
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping area is not a number")
      end
      it 'days_to_shipが「---」では登録できない' do
        @item.days_to_ship_id = '---'
        @item.valid?
        expect(@item.errors.full_messages).to include("Days to ship is not a number")
      end
    end
  end
end
