require 'rails_helper'

describe 'Usuario acessa página de cadastrar produto' do
    it 'e não está autenticado' do
        

        visit root_path
        click_on 'Cadastrar Produto'

        expect(current_path).to eq new_user_session_path
    end
    it 'com sucesso quando está autenticado' do        
        user = User.create!(email: "user@email.com", password: "password")
        product = ProductCategory.create!(name: 'Categoria_1')
    
        login_as(user)
        visit root_path
        click_on 'Cadastrar Produto'

        expect(page).to have_field 'Nome'
        expect(page).to have_field 'Preço'
        expect(page).to have_field 'Categoria do Produto'
    end   
end