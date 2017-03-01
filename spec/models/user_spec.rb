require 'rails_helper'

RSpec.describe User, type: :model do

  it 'has many links' do
    user = User.create(email: "test@gmail.com", password: "123", password_digest: "123")
    expect(user).to respond_to(:links)
    end

  context 'valid attributes' do
    it 'is valid with all attributes' do
      user = User.create(email: "test@gmail.com", password: "123", password_digest: "123")
      expect(user).to be_valid
    end
  end

  context 'invalid attributes' do
    it 'is invalid without email' do
      user = User.create(email: nil, password: "123", password_digest: "123")
      expect(user).to be_invalid
    end

    it 'is invalid without password' do
      user = User.create(email: "test@gmail.com", password: nil, password_digest: nil)
      expect(user).to be_invalid
    end

    it 'is invalid without unique email' do
     user = User.create(email: "test@gmail.com", password: "123", password_digest: "123")
     user2 = User.create(email: "test@gmail.com", password: "123", password_digest: "123")
     expect(user2).to be_invalid
   end
  end

end
