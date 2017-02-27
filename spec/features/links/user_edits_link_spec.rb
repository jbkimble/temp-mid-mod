require 'rails_helper'

RSpec.describe "can create links", :js => :true do
  scenario "Create a new link" do
      user = User.create(email: "test@gmail.com", password: "123", password_confirmation: "123")
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit '/'
      fill_in "link-url", with: "http://www.google.com"
      fill_in "link-title", with: "Google"

      click_button "Add Link"

      expect(page).to have_content("http://www.google.com")
      expect(page).to have_content("Google")
  end

  scenario "Edit link" do
    user = User.create(email: "test@gmail.com", password: "123", password_confirmation: "123")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    Link.create(title: "This", url: "http://www.test.com", user_id: user.id)
    visit '/'
    click_on "Edit"

    expect(current_path).to eq(edit_link_path(Link.last))

    fill_in "link[title]", with: "Bam"
    click_on "Update Link"

    expect(page).to have_content("Link was successfully updated")
  end

  scenario "Edit link with bad url" do
    user = User.create(email: "test@gmail.com", password: "123", password_confirmation: "123")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    Link.create(title: "This", url: "http://www.test.com", user_id: user.id)
    visit '/'
    click_on "Edit"

    expect(current_path).to eq(edit_link_path(Link.last))

    fill_in "link[url]", with: "Bam"
    click_on "Update Link"
    expect(page).to have_content("Link failed to update. URL must be valid and lead with 'http://' or 'https://'")
  end
end
