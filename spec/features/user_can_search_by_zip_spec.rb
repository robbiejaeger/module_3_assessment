require 'rails_helper'

feature 'User can search by zip code' do
  scenario 'they see a list of stores in the area' do
    VCR.use_cassette("stores") do
      visit root_path

      fill_in :zip, with: "80202"
      click_on "Find Stores"

      expect(page.status_code).to eq(200)

      expect(page).to have_css('h1', 'Search Results')
      expect(page).to have_css('h3', '17 Total Stores')
    end
  end
end
