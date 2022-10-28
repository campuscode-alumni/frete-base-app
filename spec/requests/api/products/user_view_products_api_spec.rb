require 'rails_helper'

describe 'Usuário vê produtos a partir da API' do 
  context 'GET /api/v1/products/' do 
    it 'com sucesso' do 
  
      categoria = ProductCategory.create!(
                                          name: 'Sobremesas'
  
                                      )
      Product.create!(
                      name: 'Bombom de chocolate',
                      price: 5,
                      product_category: categoria
                    )
  
      get '/api/v1/products/'
  
      expect(response).to have_http_status 200
      expect(response.content_type).to include 'application/json'
    
      json_response = JSON.parse(response.body)
  
      expect(json_response.first["name"]).to eq 'Bombom de chocolate'
      expect(json_response.first["price"]).to eq "5.0"
      expect(json_response.first["product_category_id"]).to eq 1
    end

    it 'e não há produtos cadastrados' do
      #arrange
      #act
      get '/api/v1/products/'
      #assert
      expect(response).to have_http_status 200
      expect(response.content_type).to include 'application/json'
      expect(response.body).to eq "[]"
    end

    it 'e ocorre um erro interno' do 
      categoria = ProductCategory.create!(
                                          name: 'Sobremesas'
  
                                      )
      Product.create!(
                      name: 'Bombom de chocolate',
                      price: 5,
                      product_category: categoria
                    )
    
      allow(Product).to receive(:all).and_raise(ActiveRecord::QueryCanceled)

      get '/api/v1/products/'
  
      
      expect(response).to have_http_status 500
    end
  end
end