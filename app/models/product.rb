class Product < ApplicationRecord
  belongs_to :product_category, optional: true
end



