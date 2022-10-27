class Product < ApplicationRecord
  belongs_to :product_category, optional: true

  def show_formated_price
    "R$ #{self.price.to_i},00"
  end
end



