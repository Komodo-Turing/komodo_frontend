require 'rails_helper'


RSpec.describe 'new timer' do

  it 'can edit a timer' do

    @haewon = User.create!(name: "Haewon Jeon", email: "haewonito@gmail.com", token: "something", google_id: "somethingelse", phone_number: "303-249-3081")
    timer_params = {
        user_id: @haewon.id,
        name: 'Timer',
        duration: 120,
        substance: 'Drug',
        dosage: '10oz',
        entry_instructions: 'The building code is 1234',
        notes: 'These are some notes'
      }

    TimersService.create_timers(timer_params)
    data = TimersFacade.get_timers(@haewon.id)
    #require "pry"; binding.pry
    timer = data.first

    visit "/timers/#{timer.id}"
    click_link 'Update Timer'
    expect(current_path).to eq("/timers/#{timer.id}/edit")

  end



end
