class ProductCategoriesController < ApplicationController
  
  def index
    @product_categories = ProductCategory.all
  end

  def new
    @product_category = ProductCategory.new
  end

  def create
    @product_category = ProductCategory.new(product_category_params)
    if @product_category.save
      redirect_to root_path, notice: 'Cadastrado com sucesso'
    else
      render 'new', notice: 'Não foi possível cadastrar produto'
    end
  end
  
  def show
    @product_category = ProductCategory.find(params[:id])
  end

  private 
  def product_category_params
    params.require(:product_category).permit(:name)
  end
end