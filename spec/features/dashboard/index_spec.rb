require 'rails_helper'

RSpec.describe 'the welcome page' do
  before do
    Rails.application.env_config["devise.mapping"] = Devise.mappings[:user] # If using Devise
    Rails.application.env_config["omniauth.auth"] = OmniAuth.config.mock_auth[:google_oauth2]
  end
  it 'has button to sign-in with Google' do
    # @haewon = User.create!(name: "Haewon Jeon", email: "haewonito@gmail.com", token: "something", google_id: "somethingelse", phone_number: "303-249-3081")

    visit '/'
    click_link 'Sign-In with Google'

    expect(current_path).to eq('/dashboard')
  end
end
