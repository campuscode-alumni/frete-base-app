class ProductCategoriesController < ApplicationController
  def create
    ProductCategory.create!(name: params.require(:product_category).permit(:name))
    redirect_to products_path, notice: 'Categoria cadastrada'
  end

  def search 
    nome_a_buscar = params[:busca]
    ProductCategory.where("name LIKE :param_busca OR outro_campo LIKE :param_busca OR mais_um_campo LIKE :param_busca ", 
    { param_busca: "%#{nome_a_buscar}%" }  )

    @transports = find_available_transports

  end

  private 

  def find_available_transports()
    FreightageFinder.new(transports, order).find()
  end
end