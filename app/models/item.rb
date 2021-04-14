class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :burden
  belongs_to :area
  belongs_to :day

  validates :product, :image, :explanation, :category_id, :status_id, :burden_id, :area_id, :day_id, :price, presence:true
  validates :product, length: {maximum: 40 }
  validates :explanation, length: {maximum: 1000 }
  validates :category_id, numericality: { other_than: 1 }
  validates :status_id, numericality: { other_than: 1 }
  validates :burden_id,numericality: { other_than: 1 }
  validates :area_id,numericality: { other_than: 1 }
  validates :day_id,numericality: { other_than: 1 }
  validates :price,numericality:{ greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }

  with_options presence: true, format: { with: /\A[0-9]+\z/ } do
    validates :price
  end
end
