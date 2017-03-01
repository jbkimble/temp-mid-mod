require 'rails_helper'

RSpec.describe Read, type: :model do

  it 'is valid with all attributes' do
    link = Link.create(title: "panda", url: "http://www.pandabear.com", read: false)
    expect(link).to be_valid
  end

  it 'is invalid without title' do
    link = Link.create(title: nil, url: "http://www.pandabear.com", read: false)
    expect(link).to be_invalid
  end

  it 'defaults read to false' do
    link = Link.create(title: "panda", url: "http://www.pandabear.com")
    expect(link.read).to be_falsy
  end

end
