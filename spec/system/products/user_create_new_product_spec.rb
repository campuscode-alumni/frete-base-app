require 'rails_helper'

describe 'Usuário cria um novo produto' do 
  it 'a partir de um formulário' do 

    visit root_path
    click_on 'Cadastrar Novo Produto'

    expect(page).to have_content 'Cadastrando Novo Produto'
    expect(page).to have_field 'Nome'
    expect(page).to have_field 'Preço'
    expect(page).to have_field 'Categoria de Produto'
    expect(page).to have_button 'Salvar'
  end

  it 'com sucesso' do 
    product_category = ProductCategory.create!(name: 'Eletrônicos')

    visit new_product_path
    fill_in 'Nome', with: 'TV'
    fill_in 'Preço', with: '15000'
    select 'Eletrônicos', from: 'Categoria de Produto'
    click_on 'Salvar'

    expect(page).to have_content 'Produto cadastrado com sucesso.'
    expect(page).to have_content 'Nome: TV'
    expect(page).to have_content 'Preço: 15000'
    expect(page).to have_content 'Categoria de Produto: Eletrônicos'
  end
end