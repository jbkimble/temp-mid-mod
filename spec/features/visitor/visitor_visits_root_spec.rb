require 'rails_helper'

describe "As a visitor" do
  context "When i visit root" do
    it "redirects me to a page where I see links login or sign up" do
      visit '/'

      expect(page).to have_content("Welcome To URL Lockbox!")
      expect(page).to have_content("Login")
      expect(page).to have_content("Signup")
    end
  end

  it "links me to login path" do
    visit '/'
    click_on("Login")
    expect(current_path).to eq(login_path)
  end

  it "links me to signup path" do
    visit '/'
    click_on("Signup")
    expect(current_path).to eq(signup_path)
  end
end
