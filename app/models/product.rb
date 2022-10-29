class Product < ApplicationRecord
  belongs_to :product_category
  validates :name, :price, :product_category, presence: true
end



