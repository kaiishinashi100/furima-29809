class Item < ApplicationRecord

  has_one_attached :image
  belongs_to :user

  with_options presence: true do
    
    validates  :name, length: { maximum: 40 }
    validates  :genre_id 
    validates  :place, format:
    { with: /\A[0-9]{3,7}+\z/i, message: '半角数字で300~9,999,999円までの範囲で入力してください' }
    validates  :explanation, length: { maximum: 1000 }
    validates  :status_id
    validates  :delivery_fee_id
    validates  :shipment_source_id
    validates  :delivery_completion_date_id
    validates  :user_id
  end
           
end
