require 'rails_helper'

RSpec.describe 'the navigation bar' do
  it 'can click link to users dashboard' do

    @haewon = User.create!(name: "Haewon Jeon", email: "haewonito@gmail.com", token: "something", google_id: "somethingelse", phone_number: "303-249-3081")
    
    visit '/'

    click_link 'My Dashboard'

    expect(current_path).to eq("/dashboard")
  end


end
