class PurchaseDestination
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :prefecture_id, :city, :address, :building_name, :phone_number, :purchase_id, :token

  with_options presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Enter it as follows (e.g. 123-4567)"}
    validates :city
    validates :address
    validates :phone_number
    validates :token
  end
  validates :prefecture_id, numericality: {other_than: 0, message: "can't be blank"}
  PHONENUMBER_REGEX = /\A\d{10,11}\z/.freeze
  validates :phone_number, format: {with: PHONENUMBER_REGEX, message: "is too short"}
  validates :phone_number, numericality: { only_integer: true, message: "is invalid. Input only naumber"} 


  def save
    purchase = Purchase.new(user_id: current_user.id, item_id: params[:item_id])
    Destination.create(postal_code: :postal_code, prefecture_id: :prefecture_id, city: :city, address: :address, building_name: :building_name, phone_number: :phone_number, purchase_id: :purchase_id)
  end

end