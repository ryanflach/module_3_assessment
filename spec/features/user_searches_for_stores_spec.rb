require 'rails_helper'

RSpec.describe "User searches for stores" do
  scenario 'they find stores by zip code' do
    VCR.use_cassette('search_for_stores') do
      # As a user
      # When I visit "/"
      visit '/'
      # And I fill in a search box with "80202" and click "search"
      fill_in 'zip_code', with: 80202
      click_on 'Search'
      # Then my current path should be "/search" (ignoring params)
      expect(current_path).to eq('/search')
      # And I should see stores within 25 miles of 80202
      expect(page).to have_content('Stores within 25 miles of 80202')
      # And I should see a message that says "17 Total Stores"
      expect(page).to have_content('17 Total Stores')
      # And I should see exactly 15 results
      expect(page).to have_css('#store-1')
      expect(page).to have_css('#store-15')
      expect(page).to_not have_css('#store-16')
      # And I should see the long name, city, distance, phone number and store type for each of the 15 results
      within('table thead') do
        expect(page).to have_content('Name')
        expect(page).to have_content('City')
        expect(page).to have_content('Distance')
        expect(page).to have_content('Phone Number')
        expect(page).to have_content('Store Type')
      end

      within('table tbody #store-1') do
        expect(page).to have_content('Best Buy Mobile - Cherry Creek Shopping Center')
        expect(page).to have_content('Denver')
        expect(page).to have_content(3.25)
        expect(page).to have_content('303-270-9189')
        expect(page).to have_content('Mobile')
      end
    end
  end
end
