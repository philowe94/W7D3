require 'rails_helper'

RSpec.describe UsersController, type: :controller do
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
end