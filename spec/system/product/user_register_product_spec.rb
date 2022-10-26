require 'rails_helper'
describe 'usuário registra produto' do
  it 'a partir da página inicial' do
    #Arrange
    #Act
    visit root_path
    #Assert
    expect(page).to have_link 'Cadastrar produto'
  end
end