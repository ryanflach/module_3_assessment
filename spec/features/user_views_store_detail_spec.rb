require 'rails_helper'

RSpec.describe 'User views store detail' do
  scenario 'they click on a store name returned from search' do
    VCR.use_cassette('store_detail') do
      # As a user
      # After I have searched a zip code for stores
      visit '/search?zip_code=80202'
      # When I click the name of a store
      click_on 'Best Buy Mobile - Cherry Creek Shopping Center'
      # Then my current path should be "/stores/:store_id"
      expect(current_path).to eq('/stores/2740')
      # I should see the store name, store type and address with city, state and zip
      expect(page).to have_content(
        'Best Buy Mobile - Cherry Creek Shopping Center'
      )
      expect(page).to have_content('Mobile')
      expect(page).to have_content(
        "300 East First Ave, #296 Denver, CO 80206"
      )
      # I should see an unordered list of the store hours in the following format:
      #   * Mon: 10am-9pm
      #   * Tue: 10am-9pm
      #   * Wed: 10am-9pm
      #   * Thurs: 10am-9pm
      #   * Fri: 10am-9pm
      #   * Sat: 10am-9pm
      #   * Sun: 11am-7pm
      within('ul') do
        expect(page).to have_content('Mon: 10am-9pm')
        expect(page).to have_content('Tue: 10am-9pm')
        expect(page).to have_content('Wed: 10am-9pm')
        expect(page).to have_content('Thu: 10am-9pm')
        expect(page).to have_content('Fri: 10am-9pm')
        expect(page).to have_content('Sat: 10am-9pm')
        expect(page).to have_content('Sun: 11am-6pm')
      end
    end
  end
end
