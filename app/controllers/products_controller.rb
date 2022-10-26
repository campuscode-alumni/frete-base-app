class ProductsController < ApplicationController
  
    
  def index
    @products = Product.all
  end

  def new
    @product = Product.new
    @product_categories = ProductCategory.all
  end

end