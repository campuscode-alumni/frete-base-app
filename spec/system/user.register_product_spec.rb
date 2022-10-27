require 'rails_helper'

describe 'Usuário cadastra um produto' do
    it 'a partir da tela inicial' do
        visit root_path
        
        click_on 'Cadastrar Produto'

        expect(page).to have_field('Produto')
        expect(page).to have_field('Preço')
        expect(page).to have_field('Categoria')

    end

    it 'com sucesso' do
    
    product_category = ProductCategory.create!(name: "Eletrônico")

    visit root_path
        
    click_on 'Cadastrar Produto'

    fill_in 'Produto', with: 'Celular'
    fill_in 'Preço', with: 2000
    select 'Eletrônico', from: 'Categoria'
end
end