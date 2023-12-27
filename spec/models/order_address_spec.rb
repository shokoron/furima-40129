require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order_address = FactoryBot.build(:order_address, user_id: user.id, item_id: item.id)
  end

  describe '配送先住所の保存' do
    context '配送先住所が正しく保存できるとき' do
      it 'すべての値が正しく入力されていれば保存できる' do
        expect(@order_address).to be_valid
      end

      it '建物名が空でも保存できる' do
        @order_address.building_name = ''
        expect(@order_address).to be_valid
      end
    end

    context '配送先住所が保存できないとき' do
      it '郵便番号が空だと保存できない' do
        @order_address.postal_code = ''
        expect(@order_address).not_to be_valid
      end

      it '郵便番号が「3桁ハイフン4桁」の形式でないと保存できない' do
        @order_address.postal_code = '1234567'
        expect(@order_address).not_to be_valid
      end

      it '都道府県が空だと保存できない' do
        @order_address.shipping_area_id = nil
        expect(@order_address).not_to be_valid
      end

      it '市区町村が空だと保存できない' do
        @order_address.city = ''
        expect(@order_address).not_to be_valid
      end

      it '番地が空だと保存できない' do
        @order_address.street_address = ''
        expect(@order_address).not_to be_valid
      end

      it '電話番号が空だと保存できない' do
        @order_address.phone_number = ''
        expect(@order_address).not_to be_valid
      end

      it '電話番号が10桁未満だと保存できない' do
        @order_address.phone_number = '123456789'
        expect(@order_address).not_to be_valid
      end

      it '電話番号が11桁を超えると保存できない' do
        @order_address.phone_number = '123456789012'
        expect(@order_address).not_to be_valid
      end

      it '電話番号にハイフンが含まれていると保存できない' do
        @order_address.phone_number = '090-1234-5678'
        expect(@order_address).not_to be_valid
      end
    end
  end
end
