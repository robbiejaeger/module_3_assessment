require 'rails_helper'

feature 'User can go to a store page' do
  scenario 'they see details about the store' do
    VCR.use_cassette("store") do
      visit store_path("1118")

      expect(page.status_code).to eq(200)

      within('h1') do
        expect(page).to have_content('Hato Rey')
      end

      within('h3') do
        expect(page).to have_content('Store Type: BigBox')
      end

      within('h4') do
        expect(page).to have_content('Address: 230 Calle Federico Costa Hato Rey, San Juan, PR 00918')
      end

      expect(page).to have_content('Mon: 10am-9pm')
    end
  end
end
