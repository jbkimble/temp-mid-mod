require 'rails_helper'

describe 'as a visitor' do
  it 'takes me to to the right path' do
    visit '/'
    
    expect(current_path).to eq(welcomes_path)
  end
end
