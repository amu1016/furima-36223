class Item < ApplicationRecord
  
  belongs_to :user

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category, :condition, :postage, :prefecture, :days_to_ship

  with_options presence: true do
    validates :name
    validates :description
    validates :price
  end
  with_options numericality: { other_than: 0, message: "can't be blank" } do
    validates :category_id
    validates :condition_id
    validates :postage_id
    validates :prefecture_id
    validates :days_to_ship_id
  end
end
