class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true
  validates :lastname_kanji, presence: true
  validates :firstname_kanji, presence: true
  validates :lastname_kana, presence: true, format: { with: /\A[\p{katakana}ー－・]+\z/, message: 'はカタカナで入力してください' }
  validates :firstname_kana, presence: true, format: { with: /\A[\p{katakana}ー－・]+\z/, message: 'はカタカナで入力してください' }
  validates :birthday, presence: true
end
