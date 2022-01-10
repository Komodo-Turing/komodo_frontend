require 'rails_helper'


RSpec.describe 'new timer' do

  it 'can create a new timer' do
    @haewon = User.create!(name: "Haewon Jeon", email: "haewonito@gmail.com", token: "something", google_id: "somethingelse", phone_number: "303-249-3081")
    # visit '/'
    # click_link 'Sign-In with Google'
    # save_and_open_page
    # session[:user_id] = @haewon.id

    visit '/timers/new'

    fill_in :name, with: 'Timer'
    fill_in :duration, with: 120
    fill_in :substance, with: 'Drug'
    fill_in :dosage, with: '10oz'
    fill_in :entry_instructions, with: 'The building code is 1234'
    fill_in :notes, with: 'These are some notes'

    click_button "Create Timer"
    data = TimersFacade.get_timers(@haewon.id)
    #require "pry"; binding.pry
    expect(current_path).to eq('/dashboard')

  end



end
