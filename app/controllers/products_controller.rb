class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def new
    @product = Product.new
    @product_categories = ProductCategory.all
  end

  def create
    @product_categories = ProductCategory.all
    product_params = params.require(:product).permit(:name, :price, :product_category_id)
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_path, notice: 'Produto cadastrado com sucesso.'
    else
      flash.now[:notice] = 'Não foi possível cadastrar o produto.'
      render 'new'
    end
  end
end
