require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
    end

    describe '商品出品' do
      context '商品出品がうまくいくとき' do
        it '画像,name,text,category_id,status_id,shopping_chipping,area_of_delivary_id,days_until_shopping_id,priceが存在すれば登録できる' do
          expect(@item).to be_valid
        end
        it 'priceの範囲が、¥300~¥9,999,999の間で登録できる' do
          @item.price = 300
          expect(@item).to be_valid
        end
        it 'priceが半角数字であれば登録できる' do
          @item.price = 9_999_999
          expect(@item).to be_valid
        end
      end

      context '商品出品がうまくいかないとき' do
        it '画像が空だと登録できない' do
          @item.image = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Image can't be blank")
        end
        it 'nameが空だと登録できない' do
          @item.name = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Name can't be blank")
        end
        it 'textが空だと登録できない' do
          @item.text = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Text can't be blank")
        end
        it 'category_idが空だと登録できない' do
          @item.category_id = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Category can't be blank")
        end
        it 'category_idが1だと登録できない' do
          @item.category_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include('Category must be other than 1')
        end
        it 'status_idが空だと登録できない' do
          @item.status_id = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Status can't be blank")
        end
        it 'status_idが1だと登録できない' do
          @item.status_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include('Status must be other than 1')
        end
        it 'shopping_chippingが空だと登録できない' do
          @item.shopping_chipping_id = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Shopping chipping can't be blank")
        end
        it 'shopping_chippingが1だと登録できない' do
          @item.shopping_chipping_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include('Shopping chipping must be other than 1')
        end
        it 'area_of_delivary_idが空だと登録できない' do
          @item.area_of_delivary_id = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Area of delivary can't be blank")
        end
        it 'area_of_delivary_idが1だと登録できない' do
          @item.area_of_delivary_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include('Area of delivary must be other than 1')
        end
        it 'days_until_shopping_idが空だと登録できない' do
          @item.days_until_shopping_id = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Days until shopping can't be blank")
        end
        it 'days_until_shopping_idが1だと登録できない' do
          @item.days_until_shopping_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include('Days until shopping must be other than 1')
        end
        it 'priceが空だと登録できない' do
          @item.price = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Price can't be blank")
        end
        it 'priceの範囲が、¥300以上でなければ登録できない' do
          @item.price = 299
          @item.valid?
          expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
        end
        it 'priceの範囲が、¥9,999,999以下でなければ登録できない' do
          @item.price = 10_000_000
          @item.valid?
          expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
        end
        it 'userと紐づいていなければ登録できない' do
          @item.user = nil
          @item.valid?
          expect(@item.errors.full_messages).to include('User must exist')
        end
      end
    end
  end
end
