require 'rails_helper'


RSpec.describe 'new timer' do
  before do
    Rails.application.env_config["devise.mapping"] = Devise.mappings[:user] # If using Devise
    Rails.application.env_config["omniauth.auth"] = OmniAuth.config.mock_auth[:google_oauth2]
  end
  it 'can create a new timer' do
    @haewon = User.create!(name: "Haewon Jeon", email: "haewonito@gmail.com", token: "something", google_id: "somethingelse", phone_number: "303-249-3081")

    visit '/timers/new'

    visit '/'
    click_link 'Sign-In with Google'
    click_link 'Create Timer'

    fill_in :name, with: 'Timer'
    fill_in :duration, with: 120
    fill_in :substance, with: 'Drug'
    fill_in :dosage, with: '10oz'
    fill_in :entry_instructions, with: 'The building code is 1234'
    fill_in :notes, with: 'These are some notes'

    click_button "Create Timer"
    data = TimersFacade.get_timers(@haewon.id)

    expect(current_path).to eq('/dashboard')
  end
end
