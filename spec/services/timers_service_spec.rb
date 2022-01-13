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
        id: 455,
        user_id: @haewon.id,
        name: 'Timer',
        duration: 120,
        substance: 'Drug',
        dosage: '10oz',
        entry_instructions: 'The building code is 1234',
        notes: 'These are some notes'
      }

    results = TimersService.get_timers(@haewon.id)
    first_timer = results.first

    expect(results).to be_a Hash
    expect(first_timer).to be_a Array
  end

  it 'can get a timer' do
    timer_id = 455

    result = TimersService.get_timer(timer_id)

    expect(result).to be_a Hash
    expect(result).to have_key :data
    expect(result[:data]).to be_a Hash
    expect(result[:data]).to have_key :attributes
    expect(result[:data][:attributes]).to be_a Hash
  end

  it 'can update a timer' do
    timer_id = 455
    params = {
        id: 455,
        name: 'Timer',
        duration: 120,
        substance: 'Drug',
        dosage: '10oz',
        entry_instructions: 'The building code is 1234',
        notes: 'These are some notes'
      }

    result = TimersService.update_timers(timer_id, params)

    expect(result).to be_a Hash
    expect(result).to have_key :data
    expect(result[:data]).to be_a Hash
    expect(result[:data]).to have_key :attributes
    expect(result[:data][:attributes]).to be_a Hash
  end

  it 'can delete a timer' do
    @haewon = User.create!(name: "Haewon Jeon", email: "haewonito@gmail.com", token: "something", google_id: "somethingelse", phone_number: "303-249-3081")
    timer_id = 300
    timer_params = {
        id: 300,
        user_id: @haewon.id,
        name: 'Timer',
        duration: 120,
        substance: 'Drug',
        dosage: '10oz',
        entry_instructions: 'The building code is 1234',
        notes: 'These are some notes'
      }

    TimersService.create_timers(timer_params)

    timer = TimersService.delete_timer(timer_id)

    expect(timer[:status]).to eq(nil)
  end
end
