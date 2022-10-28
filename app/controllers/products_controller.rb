class ProductsController < ApplicationController
  def index 
    @products = Product.all
  end

  def new
    @product = Product.new
    @product_categories = ProductCategory.all
  end

  def create 
    @product = Product.new new_product_params
    if @product.save 
      return redirect_to root_url, notice: 'Produto cadastrado com sucesso.'
    end
    flash.notice = 'Produto não cadastrado'
    render :new
  end

  private 

    def new_product_params
      params.require(:product).permit(
        :name, :price, :product_category_id
      )
    end
end