require 'rails_helper'

RSpec.describe User, type: :model do
    subject(:phil) {User.create(username: 'phil', password: 'password') }
    let(:incomplete_user) {User.new(not_a_username: 'user')}

    describe 'validations' do
        it { should validate_presence_of(:username) }
        it { should validate_presence_of(:password_digest) }
        it { should validate_presence_of(:session_token) }
        it { should validate_uniqueness_of(:username) }
        it { should validate_uniqueness_of(:session_token) }
        it { should validate_length_of(:password).is_at_least(6) }
    end

    describe 'User::find_by_credentials' do
        context 'if user exists in database' do
            it 'should return existing user' do
                expect(User.find_by_credentials(phil.username, phil.password)).to eq(phil)
            end
        end

        context 'if user does not exist in database' do
            it 'should return nil' do
                expect(User.find_by_credentials('tim','password')).to be(nil)
            end
        end
    end
end