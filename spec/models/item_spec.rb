require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
    end

    context '商品出品が登録できるとき' do
      it 'product、explanation、categoty_id、status_id、burden_id、area_id、day_id、price、user_idが存在するれば登録できる' do
        expect(@item).to be_valid
      end

      context '商品出品が登録できないとき' do
        it 'imageが空のとき登録できない' do
          @item.image = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Image can't be blank")
        end

        it 'productが空のとき登録できない' do
          @item.product = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Product can't be blank")
        end

        it 'productが40文字以上のとき登録できない' do
          @item.product = 'a' * 41
          @item.valid?
          expect(@item.errors.full_messages).to include('Product is too long (maximum is 40 characters)')
        end

        it 'explanationが空のとき登録できない' do
          @item.explanation = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Explanation can't be blank")
        end

        it 'explanationが1000文字以上のとき登録できない' do
          @item.explanation = 'a' * 1001
          @item.valid?
          expect(@item.errors.full_messages).to include('Explanation is too long (maximum is 1000 characters)')
        end

        it 'category_idが空のとき登録できない' do
          @item.category_id = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Category can't be blank", 'Category is not a number')
        end

        it 'category_idが1のとき登録できない' do
          @item.category_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include('Category must be other than 1')
        end

        it 'status_idが空のとき登録できない' do
          @item.status_id = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Status can't be blank", 'Status is not a number')
        end

        it 'status_idが1のとき登録できない' do
          @item.status_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include('Status must be other than 1')
        end

        it 'burden_idが空のとき登録できない' do
          @item.burden_id = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Burden can't be blank", 'Burden is not a number')
        end

        it 'burden_idが1のとき登録できない' do
          @item.burden_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include('Burden must be other than 1')
        end

        it 'area_idが空のとき登録できない' do
          @item.area_id = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Area can't be blank", 'Area is not a number')
        end

        it 'area_idが1のとき登録できない' do
          @item.area_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include('Area must be other than 1')
        end

        it 'day_idが空のとき登録できない' do
          @item.day_id = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Day can't be blank", 'Day is not a number')
        end

        it 'day_idが1のとき登録できない' do
          @item.day_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include('Day must be other than 1')
        end

        it 'priceが空のとき登録できない' do
          @item.price = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Price can't be blank", 'Price is not a number', "Price can't be blank",
                                                        'Price is invalid')
        end

        it 'priceが数字以外の文字のとき登録できない' do
          @item.price = '1a3234'
          @item.valid?
          expect(@item.errors.full_messages).to include('Price is not a number')
        end
      end
    end
  end
end
