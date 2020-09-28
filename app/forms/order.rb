class Order
  include ActiveModel::Model
  attr_accessor :token, :postal_code, :prefecture_id, :city, :address, :building, :phone_number, :user_id, :item_id, :treasurer_id

  with_options presence: true do
    ##tresurerモデルから
    # validates :user_id
    # validates :item_id

    ##addressモデルから
    # validates :treasurer_id
    validates :postal_code
    validates :city
    validates :prefecture_id
    validates :address
    validates :building
    validates :phone_number

    ##トークンと購入金額
    # validates :place
    validates :token
  end

  def save
    treasurer = Treasurer.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, city: city, prefecture_id: prefecture_id, address: address, building: building, phone_number: phone_number, treasurer_id: treasurer.id)
  end
end
