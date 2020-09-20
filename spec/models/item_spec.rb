require 'rails_helper'

RSpec.describe Item, type: :modul do
    before do
      user = FactoryBot.create(:user)
      @item = FactoryBot.build(:item, user_id: user.id)
     
    end

    describe '商品出品機能' do
      context '出品がうまくいくとき' do
        it "image,neme,genre,place,explanation,status,delivery_fee,shipment_source,delivery_completion_dateがあれば出品できる" do
          expect(@item).to be_valid
        end
        it "nameが40文字以下であれば出品できる" do
          @item.name = "a" * 40
          expect(@item).to be_valid
        end
        it "explanationが1000文字以下であれば出品できる" do
          @item.explanation = "a" * 1000
          expect(@item).to be_valid
        end
      end

      context '出品できないとき' do
        it "imageが空だと出品できない" do
          @item.image = ""
          @item.valid?
        
        end
        it "nameが空だと出品できない" do
          @item.name = ""
          @item.valid?
          expect(@item.errors.full_messages).to include("Name can't be blank")
        end
        it "nameが41文字以上だと出品できない" do
          @item.name = "a" * 41
          @item.valid?
          expect(@item.errors.full_messages).to include("Name is too long (maximum is 40 characters)")
        end
        it "explanationが空だと出品できない" do
          @item.explanation = ""
          @item.valid?
          expect(@item.errors.full_messages).to include("Explanation can't be blank")
        end
        it "explanationが1001以上だと出品できない" do
          @item.explanation = "a" *1001
          @item.valid?
          expect(@item.errors.full_messages).to include("Explanation is too long (maximum is 1000 characters)")
        end
        it "genreが空だと出品できない" do
          @item.genre_id = ""
          @item.valid?
          expect(@item.errors.full_messages).to include("Genre can't be blank")
        end
        it "statusが空だと出品できない" do
          @item.status_id = ""
          @item.valid?
          expect(@item.errors.full_messages).to include("Status can't be blank")
        end
        it "delivery_feeが空だと出品できない" do
          @item.delivery_fee_id = ""
          @item.valid?
          expect(@item.errors.full_messages).to include("Delivery fee can't be blank")
        end
        it "shipment_sourceが空だと出品できない" do
          @item.shipment_source_id = ""
          @item.valid?
          expect(@item.errors.full_messages).to include("Shipment source can't be blank")
        end
        it "delivery_completion_dateが空だと出品できない" do
          @item.delivery_completion_date_id = ""
          @item.valid?
          expect(@item.errors.full_messages).to include("Delivery completion date can't be blank")
        end
        it "placeが空だと出品できない" do
          @item.place = ""
          @item.valid?
          expect(@item.errors.full_messages).to include("Place can't be blank")
        end
      end
    end
  
end


