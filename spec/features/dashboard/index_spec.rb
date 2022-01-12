require 'rails_helper'

RSpec.describe 'the welcome page' do
  before do
    Rails.application.env_config["devise.mapping"] = Devise.mappings[:user] # If using Devise
    Rails.application.env_config["omniauth.auth"] = OmniAuth.config.mock_auth[:google_oauth2]
  end

  it 'has button to sign-in with Google' do
    visit '/'
    click_link 'Sign-In with Google'

    expect(current_path).to eq('/dashboard')
  end

  it 'has a button to create a new contact' do
    @tony = User.create!(name: "Tony Stark", email: "tonystark@gmail.com", token: "something", google_id: "somethingelse", phone_number: "303-333-1111")

    visit '/'
    click_link 'Sign-In with Google'
    click_link 'Create Contact'

    fill_in :name, with: 'Sang'
    fill_in :phone_number, with: "555-555-5555"

    click_button "Create Contact"

    new_contact = ContactsFacade.get_contacts(@tony.id).last

    expect(current_path).to eq('/dashboard')
    expect(page).to have_content("Sang")
    expect(page).to have_content("555-555-5555")
  end

  it 'has a button to update an existing contact information' do
    @tony = User.create!(name: "Tony Stark", email: "tonystark@gmail.com", token: "something", google_id: "somethingelse", phone_number: "303-333-1111")
    # params = { name: "Paul", phone_number: "303-249-3081", user_id: @tony.id }
    # @paul = ContactsFacade.create_contact(params)

    visit '/'
    click_link 'Sign-In with Google'
    click_link 'Create Contact'

    fill_in :name, with: 'Sang'
    fill_in :phone_number, with: "555-555-5555"

    click_button "Create Contact"

    expect(current_path).to eq("/dashboard")

    click_button "Update Sang's Info"
    fill_in :name, with: 'multivitamin'
    fill_in :phone_number, with: "777-777-7777"

    click_button "Update Contact"
    # updated_contact = ContactsFacade.get_contact(@john.id)
    expect(current_path).to eq('/dashboard')
    expect(page).to have_content("multivitamin")
    expect(page).to have_content("777-777-7777")
  end
end
