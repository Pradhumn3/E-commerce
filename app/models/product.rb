class Product < ApplicationRecord
  validates :name, presence: true
  validates :price, presence: true
  validates :description, presence: true
  validates :quantity, presence: true

  has_one_attached :image
end
