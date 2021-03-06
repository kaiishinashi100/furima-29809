class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  has_one :treasurer

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :genre
  belongs_to_active_hash :status
  belongs_to_active_hash :delivery_fee
  belongs_to_active_hash :shipment_source
  belongs_to_active_hash :delivery_completion_date

  with_options presence: true do
    validates  :image
    validates  :name, length: { maximum: 40 }
    validates  :genre_id, numericality: { other_than: 1, message: 'Select' }
    validates  :place, numericality:
    { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: '300~9,999,999の半角数字のみで入力してください' }
    validates  :explanation, length: { maximum: 1000 }
    validates  :status_id, numericality: { other_than: 1, message: 'Select' }
    validates  :delivery_fee_id, numericality: { other_than: 1, message: 'Select' }
    validates  :shipment_source_id, numericality: { other_than: 1, message: 'Select' }
    validates  :delivery_completion_date_id, numericality: { other_than: 1, message: 'Select' }
    validates  :user_id
  end
end

# rails db:drop → rails db:create → rails db:migrate
# ローカルで会員登録＆出品を再度実行
# git add . → git commit -m "syupping" → git push heroku master 
