class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :prefecture_id, :city, :street_address, :building_name,
                :phone_number, :token

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :postal_code, format: { with: /\A\d{3}-\d{4}\z/, message: 'は「3桁ハイフン4桁」の形式で入力してください' }
    validates :prefecture_id
    validates :city
    validates :street_address
    validates :phone_number, length: { in: 10..11 }, numericality: { only_integer: true, message: 'は半角数字のみ入力してください' }
    validates :token
  end

  def save
    purchase = Purchase.create(user_id:, item_id:)
    ShippingAddress.create(
      postal_code:,
      prefecture_id:,
      city:,
      street_address:,
      building_name:,
      phone_number:,
      purchase_id: purchase.id
    )
  end
end
