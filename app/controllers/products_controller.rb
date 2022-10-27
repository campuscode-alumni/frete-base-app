class ProductsController < ApplicationController
  def new 
    @product = Product.new
    @product_categories = ProductCategory.all
  end 
  def create
    product_params = params.require(:product).permit(:name, :product_category_id, :price)
    @product = Product.new(product_params)
    if @product.save
      redirect_to @product, notice: 'Produto cadastrado com sucesso'
    end
  end
  def show
    @product = Product.find(params[:id])
  end
end