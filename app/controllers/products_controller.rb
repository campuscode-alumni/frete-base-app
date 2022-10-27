class ProductsController < ApplicationController

  def new
    @product_categories = ProductCategory.all
    @product = Product.new
  end

  def create
    product_params = params.require(:product).permit(:name, :price, :product_category)
    @product = Product.new(product_params)
    if @product.save 
      redirect_to root_path
    end
  end
end