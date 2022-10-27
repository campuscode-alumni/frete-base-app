require 'rails_helper'

describe 'Usuário vê detalhes de produtos' do
  it 'cadastrados' do 
    #Arrange
    product_category = ProductCategory.create!(name: "Eletrônico")
    product = Product.create!(name: "Celular", price: 2000, product_category: product_category)
    
    #Act
    visit root_path

    #Assert
    expect(page).to have_content "Celular"
    expect(page).to have_content "R$2000"    
  end

  end