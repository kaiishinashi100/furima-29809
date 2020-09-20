class Item < ApplicationRecord

  has_one_attached :image
  belongs_to :user

  with_options presence: true do
    
    validates  :name, length: { maximum: 40 }
    validates  :genre_id 
    validates  :place
    validates  :explanation, length: { maximum: 1000 }
    validates  :status_id
    validates  :delivery_fee_id
    validates  :shipment_source_id
    validates  :delivery_completion_date_id
    validates  :user_id
  end
           
end
