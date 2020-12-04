require 'rails_helper'
describe  Item do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do

    context '商品出品がうまくいくとき' do
      it "image、name,text、category_id、status_id、shopping_fee_id、prefecture_id、scheduled_delivery_id、priceが存在すれば保存できる" do
        expect(@item).to be_valid
      end
      it "価格の範囲が、¥300~¥9,999,999の間の時保存される" do
        @item.price = "300"
        expect(@item).to be_valid
      end
      it "価格の範囲が、¥300~¥9,999,999の間の時保存される" do
        @item.price = "9999999"
        expect(@item).to be_valid
      end
    end

     context '商品出品がうまくいかない時' do
        it "imageが空だと出品できない" do
          @item.image = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Image can't be blank")
        end
        it "商品名が空だと出品できない" do
          @item.name = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Name can't be blank")
        end
        it "カテゴリー情報が空だと出品できない" do
          @item.category_id = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Category is not a number")
        end
        it "商品状態が空だと出品できない" do
          @item.status_id = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Status is not a number")
        end
        it "配送料の負担が空だと出品できない" do
          @item.shopping_fee_id = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Shopping fee is not a number")
        end
        it "発送元の地域が空だと出品できない" do
          @item.prefecture_id = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Prefecture is not a number")
        end
        it "発送までの日数が空だと出品できない" do
          @item.scheduled_delivery_id = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Scheduled delivery is not a number")
        end
        it "価格についての情報が空だと出品できない" do
          @item.price = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Price can't be blank", "Price is invalid", "Price is not included in the list")
        end
        it "販売価格が全角だと出品できない" do
          @item.price = "３００"
          @item.valid?
          expect(@item.errors.full_messages).to include("Price is not included in the list")
        end
        it "販売価格が299円だと出品できない" do
          @item.price = "299"
          @item.valid?
          expect(@item.errors.full_messages).to include("Price is not included in the list")
        end
        it "販売価格が10000000円だと出品できない" do
          @item.price = "10000000"
          @item.valid?
          expect(@item.errors.full_messages).to include("Price is not included in the list")
        end
    end
  end
end