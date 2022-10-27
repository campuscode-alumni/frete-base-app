require 'rails_helper' 

describe "Usuário cadastra novo produto" do
  
  it 'com sucesso' do
    #arrange
    user = User.create!(email:'user@email.com', password: 'password') 
    product_category = ProductCategory.create!(name: 'Geladeira')
    #act
    login_as(user)
    visit root_path
    click_on('Ver Categorias de Produtos')
    click_on('Geladeira')
    
    click_on('Cadastrar Produto')
    fill_in "Nome",	with: "Geladeira Smart" 
    fill_in "Valor",	with: 15500
    click_on 'Salvar'
    #assert
    expect(page).to have_content 'Descrição do Produto'
    expect(page).to have_content 'Geladeira Smart'
    expect(page).to have_content 'Preço: R$15500.0'
  end

  it 'com campos incompletos' do
    #arrange
    user = User.create!(email:'user@email.com', password: 'password')
    #act
    login_as(user)
    visit root_path
    click_on('Cadastrar Produto')
    fill_in "Nome",	with: "Geladeira Smart" 
    fill_in "Preço",	with: nil
    click_on 'Salvar'
    #assert
    expect(page).to have_content 'Não foi possível cadastrar esse produto'
  end
end
