require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品新規登録' do
    context '新規登録できるとき' do
      it '商品情報が全て正しく入力されれば登録できる' do
        expect(@item).to be_valid
      end
    end

    context '新規登録できないとき' do
      it 'nameが空では登録できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it 'descriptionが空では登録できない' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end
      it 'category_idが空では登録できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category is not a number")
      end
      it 'status_idが空では登録できない' do
        @item.status_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Status is not a number")
      end
      it 'delivery_charge_idが空では登録できない' do
        @item.delivery_charge_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery charge is not a number")
      end
      it 'prefecture_idが空では登録できない' do
        @item.prefecture_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture is not a number")
      end
      it 'shipping_day_idが空では登録できない' do
        @item.shipping_day_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping day is not a number")
      end
      it 'selling_priceが空では登録できない' do
        @item.selling_price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Selling price is not a number")
      end
      it 'selling_priceが300未満では登録できない' do
        @item.selling_price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Selling price must be greater than 299")
      end
      it 'selling_priceが10000000以上では登録できない' do
        @item.selling_price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Selling price must be less than 9999999")
      end
      it 'selling_priceが全角では登録できない' do
        @item.selling_price = 'あ'
        @item.valid?
        expect(@item.errors.full_messages).to include("Selling price is not a number")
      end
      it 'selling_priceが英字では登録できない' do
        @item.selling_price = 'aaa'
        @item.valid?
        expect(@item.errors.full_messages).to include("Selling price is not a number")
      end
      it 'selling_priceが半角カタカナでは登録できない' do
        @item.selling_price = 'ｶﾀｶﾅ'
        @item.valid?
        expect(@item.errors.full_messages).to include("Selling price is not a number")
      end
      it 'imageが空では登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'category_idがid:1では登録できない' do
        @item.category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end
      it 'status_idがid:1では登録できない' do
        @item.status_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Status must be other than 1")
      end
      it 'delivery_charge_idがid:1では登録できない' do
        @item.delivery_charge_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery charge must be other than 1")
      end
      it 'prefecture_idがid:1では登録できない' do
        @item.prefecture_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture must be other than 1")
      end
      it 'shipping_day_idがid:1では登録できない' do
        @item.shipping_day_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping day must be other than 1")
      end


    end
  end


end

