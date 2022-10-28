class Api::V1::ProductsController < ActionController::API
  rescue_from ActiveRecord::QueryCanceled, with: :return_500

  def index
    products = Product.all
    render status: 200, json: products.as_json
  end

  private 

    def return_500 
      render status: 500
    end
end