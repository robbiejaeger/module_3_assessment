require 'rails_helper'

feature 'User can search by zip code' do
  scenario 'they see a list of stores in the area' do
    VCR.use_cassette("stores") do
      visit root_path

      fill_in :zip, with: "80202"
      click_on "Find Stores"

      expect(page.status_code).to eq(200)

      within('h1') do
        expect(page).to have_content('Search Results')
      end

      within('h3') do
        expect(page).to have_content('17 Total Stores')
      end

      within('table th:nth-child(1)') do
        expect(page).to have_content('Name')
      end

      within('table tr:nth-child(2) td:nth-child(1)') do
        expect(page).to have_content('Best Buy Mobile - Cherry Creek Shopping Center')
      end
    end
  end
end
