require 'rails_helper'

RSpec.describe TimersService do

  it 'can create a timer' do
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

    results = TimersService.create_timers(timer_params)

    expect(results).to be_a Hash
    expect(results).to have_key :data
    expect(results[:data]).to be_a Hash
    expect(results[:data]).to have_key :attributes
    expect(results[:data][:attributes]).to have_key :user_id
    expect(results[:data][:attributes][:user_id]).to be_a Integer
    expect(results[:data][:attributes]).to have_key :name
    expect(results[:data][:attributes][:name]).to be_a String
    expect(results[:data][:attributes]).to have_key :duration
    expect(results[:data][:attributes][:duration]).to be_a Integer
    expect(results[:data][:attributes]).to have_key :substance
    expect(results[:data][:attributes][:substance]).to be_a String
    expect(results[:data][:attributes]).to have_key :dosage
    expect(results[:data][:attributes][:dosage]).to be_a String
    expect(results[:data][:attributes]).to have_key :entry_instructions
    expect(results[:data][:attributes][:entry_instructions]).to be_a String
    expect(results[:data][:attributes]).to have_key :notes
    expect(results[:data][:attributes][:notes]).to be_a String
  end

  it 'can get timers' do
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

    results = TimersService.get_timers(@haewon.id)
    first_timer = results.first

    expect(results).to be_a Hash
    expect(first_timer).to be_a Array
  end
end
