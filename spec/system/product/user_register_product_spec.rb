require 'rails_helper'
describe 'usuário registra produto' do
  it 'a partir da página inicial' do
    visit root_path
    click_link 'Cadastrar produto'
  
    expect(page).to have_content 'Cadastrar novo produto'
    expect(page).to have_field 'Nome', type: 'text'
    expect(page).to have_field 'Preço', type: 'number'
    expect(page).to have_select, with: 'Categoria do produto'
    expect(page).to have_button 'Salvar'
  end

  it 'com sucesso' do 
    ProductCategory.create!(name: 'Eletrônico')
    ProductCategory.create!(name: 'Papelaria')

    visit root_path
    click_link 'Cadastrar produto'
  
    fill_in 'Nome', with: 'TV 42'
    fill_in 'Preço', with: '2000'
    select 'Eletrônico', from: 'Categoria do Produto'
    click_button 'Salvar'

    expect(page).to have_content 'Produto cadastrado com sucesso'
    expect(page).to have_content 'TV 42'
    expect(page).to have_content 'Preço: R$ 2000,00'
    expect(page).to have_content 'Categoria: Eletrônico'
  end
end