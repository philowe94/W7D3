require 'rails_helper'

RSpec.describe UsersController, type: :controller do
    subject(:phil) { User.create(username: "phil", password: 'password') }
    
    describe 'get#index' do
        it 'renders user index' do
            get :index

            expect(response).to render_template(:index)
        end
    end

    describe 'get#new' do
        it 'renders new user form' do
            get :new

            expect(response).to render_template(:new)
        end
    end

    describe 'get#show' do
        it 'renders the show page for a user' do
            get :show, params: {id: phil.id }

            expect(response).to render_template(:show)
        end
    end
end