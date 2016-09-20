require 'rails_helper'

RSpec.describe 'User views store detail' do
  scenario 'they click on a store name returned from search' do
    VCR.use_cassette('store_detail') do
      visit '/search?zip_code=80202'
      click_on 'Best Buy Mobile - Cherry Creek Shopping Center'

      expect(current_path).to eq('/stores/2740')
      expect(page).to have_content(
        'Best Buy Mobile - Cherry Creek Shopping Center'
      )
      expect(page).to have_content('Mobile')
      expect(page).to have_content(
        "3000 East First Ave, #296 Denver, CO, 80206"
      )

      within('#store-hours') do
        expect(page).to have_content('Mon: 10am-9pm')
        expect(page).to have_content('Tue: 10am-9pm')
        expect(page).to have_content('Wed: 10am-9pm')
        expect(page).to have_content('Thurs: 10am-9pm')
        expect(page).to have_content('Fri: 10am-9pm')
        expect(page).to have_content('Sat: 10am-9pm')
        expect(page).to have_content('Sun: 11am-6pm')
      end
    end
  end
end
