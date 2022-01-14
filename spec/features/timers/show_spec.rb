require 'rails_helper'


RSpec.describe 'new timer' do
  before do
    Rails.application.env_config["devise.mapping"] = Devise.mappings[:user] # If using Devise
    Rails.application.env_config["omniauth.auth"] = OmniAuth.config.mock_auth[:google_oauth2]
  end
  it 'can create a new timer' do

    visit '/'
    click_link 'Sign-In with Google'
    click_link 'Create New Timer'

    fill_in :name, with: 'Timer'
    fill_in :duration, with: 120
    fill_in :substance, with: 'Drug'
    fill_in :dosage, with: '10oz'
    fill_in :entry_instructions, with: 'The building code is 1234'
    fill_in :notes, with: 'These are some notes'

    click_button "Create Timer"

    expect(current_path).to eq('/dashboard')

    click_link 'Timer'

    expect(page).to have_content('Timer')
    expect(page).to have_content(120)
    expect(page).to have_content('Drug')
    expect(page).to have_content('10oz')
    expect(page).to have_content('The building code is 1234')
    expect(page).to have_content('These are some notes')
    expect(page).to have_button('Start Timer')
    expect(page).to have_button('Edit Timer')
    expect(page).to have_button('Delete Timer')

  end
end
