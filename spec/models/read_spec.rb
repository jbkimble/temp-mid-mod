require 'rails_helper'

RSpec.describe Read, type: :model do
  context 'valid attributes' do
    it 'is valid with all attributes' do
      link = Link.create(title: "panda", url: "http://www.pandabear.com", read: false)
      read = Read.create(link_id: link.id)
      expect(read).to be_valid
    end
  end

end
