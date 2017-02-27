require 'rails_helper'

describe 'as a logged in user' do
  context 'when I visit /' do
    scenario 'I see a link to logout' do
      visit '/signup'
      fill_in "user_email", with: "test@gmail.com"
      fill_in "user_password", with: "123"
      fill_in "user_password_confirmation", with: "123"
      click_button "Submit"
      visit '/'

      expect(page).to have_content("Sign Out")
    end

    scenario 'I see a link to logout' do
      visit '/signup'
      fill_in "user_email", with: "test@gmail.com"
      fill_in "user_password", with: "123"
      fill_in "user_password_confirmation", with: "123"
      click_button "Submit"
      visit '/'

      click_on "Sign Out"
      expect(current_path).to eq(welcomes_path)
    end
  end
end
