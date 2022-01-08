require 'rails_helper'

RSpec.describe 'the welcome page' do

  it 'has button to sign-in with Google' do
    @haewon = User.create!(name: "Haewon Jeon", email: "haewonito@gmail.com", token: "something", google_id: "somethingelse", phone_number: "303-249-3081")
    
    visit '/'

    click_link 'Sign-In with Google'

    expect(current_path).to eq('/auth/google_oauth2')
  end

end
