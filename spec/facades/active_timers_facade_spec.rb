require 'rails_helper'

RSpec.describe 'Active Timers Facades' do
  xit 'creates an instance of an Active Timer' do
    active_timer_params = {
      user_id: 1,
      name: 'Timer',
      duration: 1,
      start_time: DateTime.now,
      substance: 'Drug',
      dosage: '10oz',
      entry_instructions: 'The building code is 1234',
      notes: 'These are some notes',
      status: 'Active'
    }

    expect(ActiveTimersFacade.create_active_timer(active_timer_params)).to be_an ActiveTimer
  end
end
