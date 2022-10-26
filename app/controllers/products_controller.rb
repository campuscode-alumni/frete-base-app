class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def new
    @product = Product.new
    @product_categories = ProductCategory.all
  end

  def create
    product_params = params.require(:product).permit(:name, :price, :product_category_id)
    @product = Product.new(product_params)

    if @product.save
      redirect_to root_url, notice: 'Produto cadastrado com sucesso'

    else 
      @product_categories = ProductCategory.all

      flash.now[:notice] = 'Produto não cadastrado'
      render 'new'
    end
  end
end