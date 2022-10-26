require 'rails_helper'

describe 'Usuário cadastra produto' do
  it 'com sucesso' do 
    #Arrange
    ProductCategory.create!(name: "Categoria A")
    ProductCategory.create!(name: "Categoria B")

    #Act
    visit root_path
    click_on "Cadastrar Produto"
    fill_in "Nome", with: "Produto A"
    fill_in "Preço", with: 15.00 
    select "Categoria B", from: "Categoria"
    click_on "Criar"

    #Assert
    expect(page).to have_content "Fretes"
    expect(page).to have_content "Produto cadastrado com sucesso"
    expect(page).to have_content "Produto A"
    expect(page).to have_content "Preço: R$ 15,00"
    expect(page).to have_content "Categoria: Categoria B"
  end

  it 'e não preenche todos os campos' do
    #Arrange
    ProductCategory.create!(name: "Categoria A")
    ProductCategory.create!(name: "Categoria B")

    #Act
    visit root_path
    click_on "Cadastrar Produto"
    fill_in "Nome", with: ""
    fill_in "Preço", with: "" 
    click_on "Criar"

    #Assert
    expect(page).to have_content "Produto não cadastrado"
    expect(page).to have_content "Nome não pode ficar em branco"
    expect(page).to have_content "Preço não pode ficar em branco"
  end
end
