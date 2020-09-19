class Item < ApplicationRecord

  has_one_attached :image
  belongs_to :user
  validates :name,
            :genre_id, 
            :place, 
            :explanation, 
            :status_id, 
            :delivery_fee_id, 
            :shipment_source_id, 
            :delivery_completion_date_id, 
            :user_id, 
            presence: true
end
