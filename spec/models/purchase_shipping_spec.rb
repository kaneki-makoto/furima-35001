require 'rails_helper'

RSpec.describe PurchaseShipping, type: :model do
  describe '#create' do
    before do
      item = FactoryBot.create(:item)
      user = FactoryBot.create(:user)
      @purchase = FactoryBot.build(:purchase_shipping, item_id: item.id, user_id: user.id)
      sleep(0.3)
    end

    context '商品が購入できる時' do
      it 'item_id,user_id,postal_code,prefectures_id,city,address,building,number,tokenが存在するとき' do
        expect(@purchase).to be_valid
      end

      it 'buildingが空でも購入できる' do
        @purchase.building = ""
        expect(@purchase).to be_valid
      end

    end

    context '商品出品が登録できないとき' do
      it 'item_idが空のとき登録できない' do
        @purchase.item_id = nil
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Item can't be blank")
      end

      it 'user_idが空のとき登録できない' do
        @purchase.user_id = nil
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("User can't be blank")
      end

      it 'postal_codeが空のとき登録できない' do
          @purchase.postal_code = ""
          @purchase.valid?
          expect(@purchase.errors.full_messages).to include("Postal code can't be blank", "Postal code is invalid. Include hyphen(-)")
        end

        it 'postal_codeに - が無いと登録できない' do
          @purchase.postal_code = "1111111"
          @purchase.valid?
          expect(@purchase.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
        end

        it 'prefectures＿idが空のとき登録できない' do
          @purchase.prefectures_id = nil
          @purchase.valid?
          expect(@purchase.errors.full_messages).to include("Prefectures can't be blank", "Prefectures is not a number")
        end

        it 'prefectures＿idが1のとき登録できない' do
          @purchase.prefectures_id = 1
          @purchase.valid?
          expect(@purchase.errors.full_messages).to include("Prefectures must be other than 1")
        end

        it 'cityが空のとき登録できない' do
          @purchase.city = ""
          @purchase.valid?
          expect(@purchase.errors.full_messages).to include("City can't be blank")
        end

        it 'numberが空のとき登録できない' do
          @purchase.number = ""
          @purchase.valid?
          expect(@purchase.errors.full_messages).to include("Number can't be blank")
        end

        it 'numberが11文字以上のとき登録できない' do
          @purchase.number = "1" * 12
          @purchase.valid?
          expect(@purchase.errors.full_messages).to include("Number is invalid")
        end

      end


  end
end
