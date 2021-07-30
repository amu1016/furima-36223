class Item < ApplicationRecord
  
  belongs_to :user
  has_one_attached :image


  with_options presence: true do
    validates :image
    validates :name
    validates :description
  end
  VALID_PRICEL_REGEX = /\A[0-9]+\z/
  validates  :price,  presence: true, format: {with: VALID_PRICEL_REGEX}, numericality: { only_integer: true,
    greater_than: 299, less_than: 10000000
    }

  extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to :category, :condition, :postage, :prefecture, :days_to_ship
    with_options numericality: { other_than: 0, message: "can't be blank" } do
      validates :category_id
      validates :condition_id
      validates :postage_id
      validates :prefecture_id
      validates :days_to_ship_id
    end


end