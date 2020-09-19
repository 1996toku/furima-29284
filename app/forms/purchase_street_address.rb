class PurchaseStreetAddress
  include ActiveModel::Model
  attr_accessor :token, :price, :item_id, :user_id, :postal_code, :city, :address, :phone_nunber, :purchase, :building_name, :prefectures_id, :authenticity_token

  with_options presence: true do
    validates :token
    validates :price

    validates :postal_code
    validates :city
    validates :address
    validates :phone_nunber
    validates :prefectures_id
  end

  def save
    purchase = Purchase.create(item_id: item_id, user_id: user_id)
    StreetAddress.create(postal_code: postal_code, prefectures_id: prefectures_id, city: city, address: address, building_name: building_name, phone_nunber: phone_nunber, purchase_id: purchase.id)
  end
end