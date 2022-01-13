require 'rails_helper'

RSpec.describe 'the navigation bar' do
  before do
    Rails.application.env_config["devise.mapping"] = Devise.mappings[:user] # If using Devise
    Rails.application.env_config["omniauth.auth"] = OmniAuth.config.mock_auth[:google_oauth2]
  end
  it 'can click link to users dashboard' do
    @tony = User.create!(name: "Tony Stark", email: "tonystark@gmail.com", token: "something", google_id: "somethingelse", phone_number: "303-333-1111")

    visit '/'
    
    click_link 'Sign-In with Google'

    click_link 'My Dashboard'

    expect(current_path).to eq("/dashboard")
  end
end
