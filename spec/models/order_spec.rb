require 'rails_helper'

RSpec.describe Order, type: :model do
  describe '商品購入機能' do
    before do
      @order = FactryBot.build(:order)
    end

    it 'すべて値が正しく入力されていれば購入できること' do
    end
    it ''
  end
end
