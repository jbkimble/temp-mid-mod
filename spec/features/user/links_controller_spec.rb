require 'rails_helper'

describe 'visit root' do
  it 'as a visitor takes me to the welcome page' do
    visit '/'

    expect(current_path).to eq(welcomes_path)
  end

  it 'as a user takes me to root' do
    user = User.create(email: "test3@gmail.com", password: "123", password_confirmation: "123")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit '/'

    expect(current_path).to eq('/')
  end

end
