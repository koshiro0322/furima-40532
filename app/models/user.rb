class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i, message: 'は半角英数混合で入力してください' }
  validates :lastname_kanji, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥々ー]+\z/, message: 'は全角文字で入力してください' }
  validates :firstname_kanji, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥々ー]+\z/, message: 'は全角文字で入力してください' }
  validates :lastname_kana, presence: true, format: { with: /\A[\p{katakana}ー－・]+\z/, message: 'はカタカナで入力してください' }
  validates :firstname_kana, presence: true, format: { with: /\A[\p{katakana}ー－・]+\z/, message: 'はカタカナで入力してください' }
  validates :birthday, presence: true
end
