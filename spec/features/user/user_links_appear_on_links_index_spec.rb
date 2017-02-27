require 'rails_helper'

RSpec.describe "as a user", :js => :true do
  scenario "I see my links on the link index" do
      user = User.create(email: "test3@gmail.com", password: "123", password_confirmation: "123")
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      user2 = User.create(email: "test2@gmail.com", password: "123", password_confirmation: "123")
      Link.create(title: "This", url: "http://www.test.com", user_id: user2.id)

      visit '/'
      fill_in "link-url", with: "http://www.google.com"
      fill_in "link-title", with: "Google"

      click_button "Add Link"

      expect(page).to_not have_content("http://www.test.com")
      expect(page).to have_content("http://www.google.com")
      expect(page).to have_content("Google")
    end
end
