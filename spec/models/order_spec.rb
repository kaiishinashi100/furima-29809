require 'rails_helper'

RSpec.describe Order, type: :model do
  describe '商品購入機能' do
    before do
      @order = FactoryBot.build(:order)
    end

    it 'すべて値が正しく入力されていれば購入できること' do
      expect(@order).to be_valid
    end
    it 'トークンが生成されないと購入できない' do
      @order.token = ''
      @order.valid?
      expect(@order.errors.full_messages).to include("Token can't be blank")
    end
    it '郵便番号が空だと購入できない' do
      @order.postal_code = ''
      @order.valid?
      expect(@order.errors.full_messages).to include("Postal code can't be blank")
    end
    it '郵便番号が 000-0000 の形でないと購入できない' do
      @order.postal_code = '0000'
      @order.valid?
      expect(@order.errors.full_messages).to include('Postal code is invalid')
    end
    it '都道府県が -- だと購入できない' do
      @order.prefecture_id = 1
      @order.valid?
      expect(@order.errors.full_messages).to include('Prefecture Select')
    end
    it '市区町村が空だと購入できない' do
      @order.city = ''
      @order.valid?
      expect(@order.errors.full_messages).to include("City can't be blank")
    end
    it '番地が空だと購入できない' do
      @order.address = ''
      @order.valid?
      expect(@order.errors.full_messages).to include("Address can't be blank")
    end
    it '電話番号が空だと購入できない' do
      @order.phone_number = ''
      @order.valid?
      expect(@order.errors.full_messages).to include("Phone number can't be blank")
    end
    it '電話番号が半角数字でハイフン抜きでないと購入できない' do
      @order.phone_number = '000-0000-0000'
      @order.valid?
      expect(@order.errors.full_messages).to include('Phone number is invalid')
    end
  end
end
