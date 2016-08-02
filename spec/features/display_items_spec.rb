require 'rails_helper'

feature 'User can see all the items' do
  scenario 'they see the foobar on the page' do
    visit root_path

    expect(page.status_code).to eq(200)

    expect(page).to have_css('h1', 'Items')
  end
end
