require 'rails_helper'

RSpec.describe DonationAddress, type: :model do
  describe '購入情報の保存' do

    before do
      user1 = FactoryBot.create(:user) #買い手
      user2 = FactoryBot.create(:user) #uri手
      item = FactoryBot.create(:item, user_id: user2.id)
      @donation_address = FactoryBot.build(:donation_address, user_id: user1.id, item_id: item.id)
      sleep 0.1 #テストに負荷がかかりすぎてread_timeout以内に処理が終わらない時に使用
    end

    describe '購入登録' do
      context '購入登録できるとき' do


        it '購入情報が全て正しく入力されれば登録できる' do
          expect(@donation_address).to be_valid
        end


        it 'building_nameは空でも保存できること' do
          @donation_address.building_name = ''
        expect(@donation_address).to be_valid
        end


      end

      context '購入登録できないとき' do

        it 'postal_codeが空では登録できない' do
          @donation_address.postal_code = ''
          @donation_address.valid?
          expect(@donation_address.errors.full_messages).to include( "Postal code can't be blank")
        end

        it 'postal_codeが-がない時では登録できない' do
          @donation_address.postal_code = '8112222'
          @donation_address.valid?
          expect(@donation_address.errors.full_messages).to include( "Postal code is invalid. Include hyphen(-)")
        end

        it 'municipalityが空では登録できない' do
          @donation_address.municipality = ''
          @donation_address.valid?
          expect(@donation_address.errors.full_messages).to include("Municipality can't be blank")
        end
        
        it 'addressが空では登録できない' do
          @donation_address.address = ''
          @donation_address.valid?
          expect(@donation_address.errors.full_messages).to include("Address can't be blank")
        end
        
        it 'phone_numberが空では登録できない' do
          @donation_address.phone_number = ''
          @donation_address.valid?
          expect(@donation_address.errors.full_messages).to include("Phone number can't be blank")
        end

        it 'tokenが空では登録できない' do
          @donation_address.token = ''
          @donation_address.valid?
          expect(@donation_address.errors.full_messages).to include("Token can't be blank")
        end
        
        it 'prefecture_idがid:1では登録できない' do
          @donation_address.prefecture_id = 1
          @donation_address.valid?
          expect(@donation_address.errors.full_messages).to include("Prefecture must be other than 1")
        end
        
        it 'postal_codeが全角数字では登録できない' do
          @donation_address.postal_code = '０００−００００'
          @donation_address.valid?
          expect(@donation_address.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
        end
        
        it 'postal_codeが全角では登録できない' do
          @donation_address.postal_code = 'あ'
          @donation_address.valid?
          expect(@donation_address.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
        end
        
        it 'postal_codeが英字では登録できない' do
          @donation_address.postal_code = 'aaa'
          @donation_address.valid?
          expect(@donation_address.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
        end
        
        it 'postal_codeが半角カタカナでは登録できない' do
          @donation_address.postal_code = 'ｶﾀｶﾅ'
          @donation_address.valid?
          expect(@donation_address.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
        end
        
        it 'municipalityが数字では登録できない' do
          @donation_address.municipality = '123456'
          @donation_address.valid?
          expect(@donation_address.errors.full_messages).to include("Municipality is invalid")
        end
        
        it 'municipalityが英字では登録できない' do
          @donation_address.municipality = 'aaaaaaa'
          @donation_address.valid?
          expect(@donation_address.errors.full_messages).to include("Municipality is invalid")
        end
        
        it 'phone_numberが全角では登録できない' do
          @donation_address.phone_number = 'あ'
          @donation_address.valid?
          expect(@donation_address.errors.full_messages).to include("Phone number is invalid")
        end
        
        it 'phone_numberが英字では登録できない' do
          @donation_address.phone_number = 'aaa'
          @donation_address.valid?
          expect(@donation_address.errors.full_messages).to include("Phone number is invalid")
        end
        
        it 'phone_numberが半角カタカナでは登録できない' do
          @donation_address.phone_number = 'ｶﾀｶﾅ'
          @donation_address.valid?
          expect(@donation_address.errors.full_messages).to include("Phone number is invalid")
        end

        it 'phone_numberが12桁以上では登録できない' do
          @donation_address.phone_number = '080222233334'
          @donation_address.valid?
          expect(@donation_address.errors.full_messages).to include("Phone number is invalid")
        end

        it 'phone_numberが英数字混合では登録できない' do
          @donation_address.phone_number = '0802222aaaa'
          @donation_address.valid?
          expect(@donation_address.errors.full_messages).to include("Phone number is invalid")
        end

        it 'phone_numberがuser_id空では登録できない' do
          @donation_address.user_id = ''
          @donation_address.valid?
          expect(@donation_address.errors.full_messages).to include("User can't be blank")
        end

        it 'phone_numberがitem_id空では登録できない' do
          @donation_address.item_id = ''
          @donation_address.valid?
          expect(@donation_address.errors.full_messages).to include("Item can't be blank")
        end
      end
    end
  end
end
