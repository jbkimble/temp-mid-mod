require 'rails_helper'

describe "As a user" do
  context "when i visit /" do
    it "shows me all my links" do
      user = User.create(email: "test@gmail.com", password: "123", password_confirmation: "123")
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      # visit '/'
      # fill_in "link-url", with: "http://www.google.com"
      # fill_in "link-title", with: "Google"
      #
      # click_button "Add Link"
      # visit '/'
      #
      # expect(page).to have_content("http://www.google.com")
      # expect(page).to have_content("Google")
    end

    it "does not show me others links" do

    end
  end
end
