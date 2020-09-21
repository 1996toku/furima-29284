require 'rails_helper'

RSpec.describe PurchaseStreetAddress, type: :model do
  describe '#create' do
    before do
      @listing_user = FactoryBot.build(:user)
      @purchase_user = FactoryBot.build(:user)
      @item = FactoryBot.build(:item, user_id: @listing_user.id)
      @purchase = FactoryBot.build(:purchase_street_address, user_id: @purchase_user.id, item_id: @item.id)
    end

    describe '商品購入' do
      context '商品購入がうまくいくとき' do
        it 'クレジットカード情報,postal_code,prefecture_id,city,address,building_name,phone_nunber,が存在すれば登録できる' do
           expect(@purchase).to be_valid
        end
        it 'building_nameが入力されていなくても登録できる' do
          @purchase.building_name = ''
          expect(@purchase).to be_valid
        end
        it 'postal_codeが半角数字3文字、ハイフン、半角数字4文字の順であれば登録できる' do
          @purchase.postal_code = '234-3456'
          expect(@purchase).to be_valid
        end
        it 'phone_nunberが11桁以内であれば登録できる' do
          @purchase.phone_nunber = '00012345678'
          expect(@purchase).to be_valid
        end
      end

      context '商品出品がうまくいかないとき' do
        it 'クレジットカード情報が正しく入力されていないと登録できない' do
          @purchase.token = ''
          @purchase.valid?
          expect(@purchase.errors.full_messages).to include("Token can't be blank")
        end
        it 'postal_codeが空だと登録できない' do
          @purchase.postal_code = ''
          @purchase.valid?
          expect(@purchase.errors.full_messages).to include("Postal code can't be blank")
        end
        it 'postal_codeが半角数字3文字、ハイフン、半角数字4文字の順でなければ登録できない' do
          @purchase.postal_code = '3334444'
          @purchase.valid?
          expect(@purchase.errors.full_messages).to include("Postal code is invalid. Input half-width 7 characters including hyphen.")
        end
        it 'prefectures_idが1だと登録できない' do
          @purchase.prefectures_id = '1'
          @purchase.valid?
          expect(@purchase.errors.full_messages).to include("Prefectures must be other than 1")
        end
        it 'cityが空だと登録できない' do
          @purchase.city = ''
          @purchase.valid?
          expect(@purchase.errors.full_messages).to include("City can't be blank")
        end
        it 'addressが空だと登録できない' do
          @purchase.address = ''
          @purchase.valid?
          expect(@purchase.errors.full_messages).to include("Address can't be blank")
        end
        it 'phone_nunberが空だと登録できない' do
          @purchase.phone_nunber = ''
          @purchase.valid?
          expect(@purchase.errors.full_messages).to include("Phone nunber can't be blank")
        end
        it 'phone_nunberが12桁以上だと登録できない' do
          @purchase.phone_nunber = '123456789123'
          @purchase.valid?
          expect(@purchase.errors.full_messages).to include("Phone nunber is too long (maximum is 11 characters)")
        end
      end
    end
  end
end
