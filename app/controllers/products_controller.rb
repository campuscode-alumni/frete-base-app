class ProductsController < ApplicationController
  #before_action :set_product, only: %i[ show edit update destroy ]

  # GET /products
  def index

  end

  # GET /products/1
  def show
    @product = Product.find(params[:id])
    @product_category = ProductCategory.find(params[:product_category_id])
  end

  # GET /products/new
  def new
    @product_category = ProductCategory.find(params[:product_category_id])
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products
  def create
    product_params = params.require(:product).permit(:name, :price)
    @product_category = ProductCategory.find(params[:product_category_id])
    @product = Product.new(product_params)
    @product.product_category_id = @product_category.id
    
    if @product.save 
      redirect_to product_category_product_path(@product_category.id, @product.id ), notice: 'Cadastrado com sucesso'
    else
      render 'new', notice: 'Não foi possível cadastrar produto'
    end
    
  end

  # PATCH/PUT /products/1
  def update

  end

  # DELETE /products/1
  def destroy

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def product_params
      params.require(:product).permit(:name, :price)
    end
end
