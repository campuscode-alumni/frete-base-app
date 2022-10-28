class Api::V1::ProductsController < ActionController::API
  def index
    products = Product.all
    render status: 200, json: products.as_json
  end
end