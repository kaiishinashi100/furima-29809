class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true, length: { maximum: 10 }

  validates :email, presence: true,format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i, essage: "正しく入力してください"}

  validates :password, presence: true,
            format: { with: /\A[a-z0-9]+\z/i, message: "英数字を含めてください" }

  validates :family_name_full_width,
            :first_name_full_width, 
            presence: true,
            format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: "全角文字を使用してください" }

  validates :family_name_kana,
            :first_name_kana,
            presence: true,
            format: { with: /\A([ァ-ン]|ー)+\z/, message: "カタカナで入力してください"}

  validates :birth_day,
            presence: true
end
