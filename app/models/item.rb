class Item < ApplicationRecord
  
  belongs_to :user
  has_one_attached :image
  # has_one :purchase


  with_options presence: true do
    validates :image
    validates :name
    validates :description
  end

  extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to :category
    belongs_to :condition
    belongs_to :postage
    belongs_to :prefecture
    belongs_to :days_to_ship
    with_options numericality: { other_than: 0, message: "can't be blank" } do
      validates :category_id
      validates :condition_id
      validates :postage_id
      validates :prefecture_id
      validates :days_to_ship_id
    end
  
  validates :price, presence: true, numericality: { only_integer: true, message: "is invalid. Input half-width characters"} 
  validates :price, numericality: { greater_than: 299, less_than: 10000000, message: "is out of setting range"}
end