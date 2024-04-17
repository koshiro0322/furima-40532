class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :prefecture_id, :city, :street_address, :building_name,
                :phone_number, :token

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :postal_code
    validates :prefecture_id
    validates :city
    validates :street_address
    validates :phone_number
    validates :token
  end
  validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }

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
