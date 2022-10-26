class ProductsController < ApplicationController


  def new
    @product_categories = ProductCategory.all
    @product = Product.new()
  end

  def create

    product_params = params.require(:product).permit(:name, :price, :product_category_id)
    product = Product.new(product_params)
    product.save!
    redirect_to root_path, notice: "Produto adicionado!"

  end
  
end
