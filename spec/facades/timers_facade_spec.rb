require 'rails_helper'

RSpec.describe TimersFacade do
  it 'can create timers' do
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

  it 'can get a timer' do
    @haewon = User.create!(name: "Haewon Jeon", email: "haewonito@gmail.com", token: "something", google_id: "somethingelse", phone_number: "303-249-3081")
    timer_id = 455
    timer_params = {
        id: 455,
        user_id: @haewon.id,
        name: 'Timer',
        duration: 120,
        substance: 'Drug',
        dosage: '10oz',
        entry_instructions: 'The building code is 1234',
        notes: 'These are some notes'
      }

    timer = TimersFacade.get_timer(timer_id)

    expect(timer.name).to eq('Timer')
    expect(timer.duration).to eq(120)
    expect(timer.substance).to eq('Drug')
    expect(timer.dosage).to eq('10oz')
    expect(timer.entry_instructions).to eq('The building code is 1234')
    expect(timer.notes).to eq('These are some notes')
  end

  it 'can update_timers' do
    @haewon = User.create!(name: "Haewon Jeon", email: "haewonito@gmail.com", token: "something", google_id: "somethingelse", phone_number: "303-249-3081")
    timer_id = 455
    params = {
        id: 455,
        user_id: @haewon.id,
        name: 'Timer',
        duration: 120,
        substance: 'Drug',
        dosage: '10oz',
        entry_instructions: 'The building code is 1234',
        notes: 'These are some notes'
      }

    timer = TimersFacade.update_timers(timer_id, params)

    expect(timer[:data][:attributes][:name]).to eq('Timer')
    expect(timer[:data][:attributes][:duration]).to eq(120)
    expect(timer[:data][:attributes][:substance]).to eq('Drug')
    expect(timer[:data][:attributes][:dosage]).to eq('10oz')
    expect(timer[:data][:attributes][:entry_instructions]).to eq('The building code is 1234')
    expect(timer[:data][:attributes][:notes]).to eq('These are some notes')
  end

  it 'can delete a timer' do
    @haewon = User.create!(name: "Haewon Jeon", email: "haewonito@gmail.com", token: "something", google_id: "somethingelse", phone_number: "303-249-3081")
    timer_id = 650
    params = {
        id: 650,
        user_id: @haewon.id,
        name: 'Timer',
        duration: 120,
        substance: 'Drug',
        dosage: '10oz',
        entry_instructions: 'The building code is 1234',
        notes: 'These are some notes'
      }
    TimersService.create_timers(params)

    timer = TimersFacade.delete_timer(timer_id)

    expect(timer[:status]).to eq(nil)
  end
end
