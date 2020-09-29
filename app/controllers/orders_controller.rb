class OrdersController < ApplicationController
  before_action :set_order, only: [:index, :create]
  def index
  end

  def create
    @order = Order.new(order_params)
    if @order.valid?
      pay_item
      @order.save
      redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def order_params
    params.permit(:token, :postal_code, :prefecture_id, :city, :address, :building, :phone_number, :treasurer_id, :item_id, :place).merge(user_id: current_user.id)
  end

  def set_order
    @item = Item.find_by(params[:item_id])
  end

  def pay_item
    @item = Item.find_by(params[:item_id])
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.place,
      card: order_params[:token],
      currency: 'jpy'
    )
  end
end
