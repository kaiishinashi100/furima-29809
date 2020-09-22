class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :user

  with_options presence: true do
    validates  :name, length: { maximum: 40 }
    validates  :genre_id, numericality: { other_than: 1, message: 'Select'}
    validates  :place, format:
    { with: /\A[[3-9][0-9]{2}|[1-9][0-9]{3,6}]+\z/i, message: '300~9,999,999の半角数字のみで入力してください' }
    validates  :explanation, length: { maximum: 1000 }
    validates  :status_id, numericality: {other_than: 1, message: 'Select'}
    validates  :delivery_fee_id, numericality: {other_than: 1, message: 'Select'}
    validates  :shipment_source_id, numericality: {other_than: 1, message: 'Select'}
    validates  :delivery_completion_date_id, numericality: {other_than: 1, message: 'Select'}
    validates  :user_id
  end
end
