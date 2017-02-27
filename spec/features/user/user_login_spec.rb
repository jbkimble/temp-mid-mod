require 'rails_helper'

describe 'as a logged out user' do
  context 'when I visit /login' do
    scenario 'I am able to login' do
      visit '/signup'
      fill_in "user_email", with: "test@gmail.com"
      fill_in "user_password", with: "123"
      fill_in "user_password_confirmation", with: "123"
      click_button "Submit"

      visit '/login'
      fill_in "email", with: "test@gmail.com"
      fill_in "password", with: "123"
      click_button "Submit"
      expect(page).to have_content("Successfully logged in!")
    end

    scenario 'It flashes failure if my login is unsuccessful' do
      visit '/signup'
      fill_in "user_email", with: "test@gmail.com"
      fill_in "user_password", with: "123"
      fill_in "user_password_confirmation", with: "123"
      click_button "Submit"

      visit '/login'
      fill_in "email", with: "test@gmail.com"
      fill_in "password", with: "1234"
      click_button "Submit"
      expect(page).to have_content("Login failed, please try again")
    end
  end
end
