require 'rails_helper'

describe 'as a visitor' do
  context 'when i visit /signup' do
    it 'shows me a form to enter my information' do
      visit '/signup'
      expect(page).to have_content("Signup!")
      expect(page).to have_content("Email")
      expect(page).to have_content("Password")
      expect(page).to have_content("Password Confirmation")
    end

    it 'shows me an error message if my passwords do not match' do
      visit '/signup'
      fill_in "user_email", with: "test@gmail.com"
      fill_in "user_password", with: "123"
      fill_in "user_password_confirmation", with: "12345"
      click_button "Submit"

      expect(page).to have_content("Password confirmation doesn't match Password. Your account failed to be created")
    end

    it 'shows me an error message if email is already taken' do
      visit '/signup'
      fill_in "user_email", with: "test@gmail.com"
      fill_in "user_password", with: "123"
      fill_in "user_password_confirmation", with: "123"
      click_button "Submit"

      visit '/signup'
      fill_in "user_email", with: "test@gmail.com"
      fill_in "user_password", with: "12345"
      fill_in "user_password_confirmation", with: "12345"
      click_button "Submit"

      expect(page).to have_content("Email has already been taken. Your account failed to be created")
    end

    it 'shows me an error message if email is blank' do
      visit '/signup'
      fill_in "user_email", with: ""
      fill_in "user_password", with: "123"
      fill_in "user_password_confirmation", with: "123"
      click_button "Submit"

      expect(page).to have_content("Email can't be blank. Your account failed to be created")
    end

    it 'shows multiple error message if multiple errors' do
      visit '/signup'
      fill_in "user_email", with: "test@gmail.com"
      fill_in "user_password", with: "123"
      fill_in "user_password_confirmation", with: "123"
      click_button "Submit"

      visit '/signup'
      fill_in "user_email", with: "test@gmail.com"
      fill_in "user_password", with: "123"
      fill_in "user_password_confirmation", with: "12345"
      click_button "Submit"

      expect(page).to have_content("Password confirmation doesn't match Password and Email has already been taken. Your account failed to be created")
    end

    it 'shows multiple error message if multiple errors' do
      visit '/signup'
      fill_in "user_email", with: "test@gmail.com"
      fill_in "user_password", with: "123"
      fill_in "user_password_confirmation", with: "123"
      click_button "Submit"

      expect(current_path).to eq('/')
      expect(page).to have_content("URL:")
      expect(page).to have_content("Title:")
      expect(page).to have_content("Hot Reads!")
      expect(page).to have_content("Welcome, your account was successfully created.")
    end
  end
end
