class Item < ApplicationRecord
  belongs_to :user

  validates :product, :explanation, :category_id, :status_id, :burden_id, :area_id, :day_id, :price, presence:true
end