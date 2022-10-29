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

  it 'e volta para a tela inicial' do  
    user = User.create!(email:'joao@campuscode.com', password:'12345678')
    ProductCategory.create!(name:'Artigos para o lar')

    login_as(user)
    visit root_path
    click_on 'Produtos'
    click_on 'Cadastrar produto'
    click_on 'Voltar'
    click_on 'Voltar'
    
    expect(page).not_to have_link("Voltar")
    expect(page).to have_content("Sistema de Frete e Transportadoras")
    expect(page).to have_link("Início")
    expect(page).to have_link("Produtos")
    expect(page).to have_link("Sair")
    expect(current_path).to eq root_path
  end

  it 'e não está autenticado' do  
    user = User.create!(email:'joao@campuscode.com', password:'12345678')
    ProductCategory.create!(name:'Artigos para o lar')

    visit root_path
    click_on 'Produtos'
    
    expect(page).not_to have_link("Voltar")
    expect(page).not_to have_content("Sistema de Frete e Transportadoras")
    expect(page).not_to have_link("Sair")
    expect(page).to have_text("Realize login para continuar ou crie uma nova conta")
    expect(page).to have_field("E-mail")
    expect(page).to have_field("Senha")
    expect(page).to have_button("Log in")
  end
end