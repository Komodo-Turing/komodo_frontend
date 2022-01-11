require 'rails_helper'

RSpec.describe Timer do
  it 'has timer attributes' do
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
    first_timer = data.first

    expect(first_timer.name).to eq('Timer')
    expect(first_timer.duration).to eq(120)
    expect(first_timer.substance).to eq('Drug')
    expect(first_timer.dosage).to eq('10oz')
    expect(first_timer.entry_instructions).to eq('The building code is 1234')
    expect(first_timer.notes).to eq('These are some notes')
  end
end
