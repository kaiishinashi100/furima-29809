class Article < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :genre
  belongs_to_active_hash :status
  belongs_to_active_hash :delivery_fee
  belongs_to_active_hash :shipment_source
  belongs_to_active_hash :delivery_completion_date


  validates :genre_id,                     numericality: { other_than: 1 }
  validates :status_id,                    numericality: { other_than: 1 }
  validates :delivery_fee_id,              numericality: { other_than: 1 }
  validates :shipment_source_id,           numericality: { other_than: 1 }
  validates :delivery_completion_date_id,  numericality: { other_than: 1 }
end
