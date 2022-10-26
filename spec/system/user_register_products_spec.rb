require 'rails_helper'

describe 'Usuário cadastra produto' do
  it 'a partir da tela inicial' do
    #arrange
    #act
    visit root_path
    click_on 'Cadastrar produto'

    #assert
    expect(current_path).to eq new_product_path
  end

  it 'com sucesso' do
    #arrange
    product_category = ProductCategory.create!(name: 'eletrônicos')
    #act
    visit root_path
    click_on 'Cadastrar produto'
    fill_in 'Nome', with: 'TV'
    select 'eletrônicos', from: 'Categoria'
    fill_in 'Preço', with: 1050
    click_on 'Salvar'

    #assert
    expect(current_path).to eq root_path
    expect(page).to have_content 'TV - eletrônicos - R$ 1050'
  end
end
