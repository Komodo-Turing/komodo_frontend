require 'rails_helper'

RSpec.describe 'active timers show' do
  before do
    Rails.application.env_config["devise.mapping"] = Devise.mappings[:user] # If using Devise
    Rails.application.env_config["omniauth.auth"] = OmniAuth.config.mock_auth[:google_oauth2]
  end
  xit 'show an active timer' do

    visit '/'
    click_link 'Sign-In with Google'
    click_link 'Create New Timer'

    fill_in :name, with: 'Timer'
    fill_in :duration, with: 1
    fill_in :substance, with: 'Drug'
    fill_in :dosage, with: '10oz'
    fill_in :entry_instructions, with: 'The building code is 1234'
    fill_in :notes, with: 'These are some notes'

    click_button "Create Timer"

    expect(current_path).to eq('/dashboard')

    click_link 'Timer'
    click_button 'Start Timer'
  end
end
