require 'rails_helper'
RSpec.describe OrderAddress, type: :model do
  
    before do
      @order_address = FactoryBot.build(:order_address)
    end

    describe '商品購入' do

      context '商品購入がうまくいくとき' do
        it "全ての値が正しく入力されている時" do
          expect(@order_address).to be_valid
        end
        it "建物が空でも購入できる" do
          @order_address.building_name = nil
          @order_address.valid?
          expect(@order_address).to be_valid
        end
      end
   
      context '商品購入がうまくいかないとき' do
        it "郵便番号がからの時登録できない" do
          @order_address.postal_code = nil
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("Postal code can't be blank", "Postal code is invalid")
        end
        it "郵便番号にハイフンがないと登録できない" do
          @order_address.postal_code = '1234567'
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("Postal code is invalid")
        end
        it '都道府県が0の場合、登録できない' do
          @order_address.prefecture_id = 0
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("Prefecture must be other than 0")
        end
        it "市区町村が空の場合、登録できない" do
          @order_address.city = nil
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("City can't be blank")
        end
        it "番地が空の場合、登録できない" do
          @order_address.address = nil
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("Address can't be blank")
        end
        it "電話番号が空の場合、登録できない" do
          @order_address.phone_number = nil
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("Phone number can't be blank", "Phone number is invalid")
        end
        it "電話番号にハイフンがある場合、登録できない" do
          @order_address.phone_number = '090-00000000'
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("Phone number is invalid")
        end
        it "電話番号が12桁以上の場合、登録できない" do
          @order_address.phone_number = '090000000000'
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("Phone number is invalid")
        end
        it "建物が空では登録できない" do
          @order_address.prefecture_id = nil
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("Prefecture can't be blank", "Prefecture is not a number")
        end
        it "user_idがなくても登録できないこと" do
          @order_address.user_id = nil
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("User can't be blank")
        end
        it "item_idがなくても登録できないこと" do
          @order_address.item_id = nil
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("Item can't be blank")
        end
      end

    end
    
end