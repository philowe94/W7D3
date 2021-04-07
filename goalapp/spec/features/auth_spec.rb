require 'spec_helper'
require 'rails_helper'

feature 'the signup process' do
  scenario 'has a new user page' do
    visit new_user_url
    expect(page).to have_content("New User")
  end

  feature 'signing up a user' do
    visit new_user_url
    fill_in 'username', with: "testuser"
    fill_in 'password', with: "banana"
    click_on 'Create User'

    scenario 'shows username on the homepage after signup' do
      expect(page).to have_content("testuser")
    end

  end
end

feature 'logging in' do
  scenario 'shows username on the homepage after login'

end

feature 'logging out' do
  scenario 'begins with a logged out state'

  scenario 'doesn\'t show username on the homepage after logout'

end