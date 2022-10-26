require 'rails_helper'

describe 'Usuario acessa página de cadastrar produto' do
    it 'e não está autenticado' do
        

        visit root_path
        click_on 'Cadastrar Produto'

        expect(current_path).to eq new_user_session_path
    end
end
