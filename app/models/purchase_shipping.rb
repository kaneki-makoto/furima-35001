class PurchaseShipping
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :prefectures_id, :city, :address, :building, :number, :token

  validates :postal_code, :prefectures_id, :city, :address, :number, :item_id, :user_id, :token, presence: true
  validates :postal_code,format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  validates :number,  format: { with: /\A[0-9]{10,11}\z/ } 
  with_options numericality: { other_than: 1 } do
    validates :prefectures_id
  end

  def save
    purchase = Purchase.create(item_id: item_id, user_id: user_id)
    Shipping.create(postal_code: postal_code, prefectures_id: prefectures_id, city: city, address: address, building: building, number: number, purchase_id: purchase.id)
  end
end
 