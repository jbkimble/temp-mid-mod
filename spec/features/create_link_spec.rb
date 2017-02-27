require "rails_helper"

RSpec.describe "can create links", :js => :true do
  scenario "Create a new link" do
    visit '/signup'
    fill_in "user_email", with: "test@gmail.com"
    fill_in "user_password", with: "123"
    fill_in "user_password_confirmation", with: "123"
    click_button "Submit"

    visit '/login'
    fill_in "email", with: "test@gmail.com"
    fill_in "password", with: "123"
    click_button "Submit"

    visit "/"
    fill_in "Title:", :with => "Turing"
    fill_in "URL:", :with => "http://turing.io"
    click_on "Add Link"

    within('#links-list') do
      expect(page).to have_text("Turing")
      expect(page).to have_text("http://turing.io")
    end
  end
    # xscenario "link must be valid" do
    #   visit '/signup'
    #   fill_in "user_email", with: "test@gmail.com"
    #   fill_in "user_password", with: "123"
    #   fill_in "user_password_confirmation", with: "123"
    #   click_button "Submit"
    #
    #   visit '/login'
    #   fill_in "email", with: "test@gmail.com"
    #   fill_in "password", with: "123"
    #   click_button "Submit"
    #
    #   visit "/"
    #   fill_in "Title:", :with => "Turing"
    #   fill_in "URL:", :with => "turing.io"
    #   click_on "Add Link"
    #   expect(page).to have_text("Url must be valid")
    # end
end
