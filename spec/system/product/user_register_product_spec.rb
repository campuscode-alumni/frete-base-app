require 'rails_helper'

describe 'Usuário cadastra produto' do 
  it 'com sucesso' do  
    user = User.create!(email:'joao@campuscode.com', password:'12345678')
    ProductCategory.create!(name:'Eletrônicos')

    login_as(user)
    visit root_path
    click_on 'Produtos'
    click_on 'Cadastrar produto'
    fill_in 'Nome', with: 'XBox'
    fill_in 'Preço', with: '1000'
    select 'Eletrônicos', from: 'Modelo de produto'
    click_on 'Salvar'

    expect(page).to have_content("Produto cadastrado com sucesso")
    expect(page).to have_content("Nome: XBox")
    expect(page).to have_content("Preço: R$ 1.000,00")
    expect(page).to have_content("Modelo de produto: Eletrônicos")
    expect(page).to have_link("Voltar")
  end 

  it 'e mantém campos obrigatórios' do  
    user = User.create!(email:'joao@campuscode.com', password:'12345678')
    ProductCategory.create!(name:'Eletrodométicos')
  
    login_as(user)
    visit root_path
    click_on 'Produtos'
    click_on 'Cadastrar produto'
    fill_in 'Nome', with: ''
    fill_in 'Preço', with: ''
    click_on 'Salvar'
  
    expect(page).to have_content("Nome não pode ficar em branco")
    expect(page).to have_content("Preço não pode ficar em branco")
    expect(page).to have_content("Modelo de produto não pode ficar em branco")
    expect(page).to have_content("Modelo de produto é obrigatório")
    expect(page).to have_link("Voltar")
  end
end