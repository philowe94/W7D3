require 'spec_helper'
require 'rails_helper'

feature 'the signup process' do
  scenario 'has a new user page' do
    visit new_user_url
    expect(page).to have_content("New User")
  end

  feature 'signing up a user' do
    before(:each) do
      visit new_user_url
      fill_in 'username', with: "testuser"
      fill_in 'password', with: "banana"
      click_on 'Create User'
    end

    scenario 'shows username on the homepage after signup' do
      expect(page).to have_content("testuser")
    end

  end
end

feature 'logging in' do
  User.create(username: "Luke", password: "starwars")
  before(:each) do
    visit new_session_url
    fill_in 'username', with: "Luke"
    fill_in 'password', with: "starwars"
    click_button 'Login'
  end

  scenario 'shows username on the homepage after login' do
    expect(page).to have_content("Luke")
  end

end

feature 'logging out' do
  User.create(username: "Luke", password: "starwars")
  
  scenario 'begins with a logged out state' do
    visit users_url
    expect(page).to_not have_content("Luke")
  end
    

  scenario 'doesn\'t show username on the homepage after logout' do
    visit new_session_url
    fill_in 'username', with: "Luke"
    fill_in 'password', with: "starwars"
    click_button 'Login'
    click_button 'Logout'
    expect(page).to_not have_content("Luke")
  end

end