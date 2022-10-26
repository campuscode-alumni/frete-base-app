require 'rails_helper'


describe "Usuário registra produto" do
  it 'a partir da página inicial' do
    ProductCategory.create!(name: "Eletrônicos")
    ProductCategory.create!(name: "Vestuário")

    visit root_path
    click_on "Adicionar novo produto"

    expect(current_path).to eq(new_product_path)
    expect(page).to have_field("Nome")
    expect(page).to have_field("Preço")
    expect(page).to have_select("Categoria")
    expect(page).to have_button("Salvar")
  end

  it 'com sucesso' do
    ProductCategory.create!(name: "Eletrônicos")
    ProductCategory.create!(name: "Vestuário")

    visit root_path
    click_on "Adicionar novo produto"
    fill_in "Nome", with: "Celular S20"
    fill_in "Preço", with: 10.00
    select "Eletrônicos", from: "Categoria"
    click_on "Salvar"

    expect(current_path).to eq(root_path)
    expect(page).to have_content("Produto adicionado!")
    expect(page).to have_content("Celular S20")
    expect(page).to have_content("R$ 10,00")
    expect(page).to have_content("Eletrônicos")
  end
end