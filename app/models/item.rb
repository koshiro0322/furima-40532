class Item < ApplicationRecord
  belongs_to :user
  has_one :purchase
  has_one_attached :image

  validates :itemname, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates :category_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :condition_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :shipping_fee_responsibility_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :prefecture_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :shipping_duration_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_fee_responsibility
  belongs_to :prefecture
  belongs_to :shipping_duration
end
