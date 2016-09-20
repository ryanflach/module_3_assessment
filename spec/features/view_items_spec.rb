require 'rails_helper'

RSpec.describe 'Views items' do
  scenario 'reaches the root path' do
    visit '/'

    expect(page.status_code).to eq(200)

    within('h1') do
      expect(page).to have_content('Items')
    end
  end
end
