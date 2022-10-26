require 'rails_helper'

describe 'Usuário vê a home page' do 
  it 'com sucesso' do 
    visit root_path

    expect(page).to have_content 'Estoque de Produto'
    expect(page).to have_link 'Cadastrar Novo Produto'
  end
end