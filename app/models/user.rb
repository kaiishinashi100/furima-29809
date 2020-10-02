class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :treasurers

  with_options presence: true do
    validates :nickname, length: { maximum: 10 }
    validates :email, format:
              { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i, essage: '正しく入力してください' }
    validates :password, format:
              { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{6}+\z/i, message: '英数字を含めてください' }
    validates :family_name_full_width,
              :first_name_full_width, format:
              { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: '全角文字を使用してください' }
    validates :family_name_kana,
              :first_name_kana, format:
              { with: /\A([ァ-ン]|ー)+\z/, message: 'カタカナで入力してください' }
    validates :birth_day
  end
end
