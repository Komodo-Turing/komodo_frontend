require 'rails_helper'

RSpec.describe ContactsService do
  it '#get_contacts', :vcr do
    user_id = 2
    response = ContactsService.get_contacts(user_id)

    expect(response).to be_a Hash
    expect(response[:data][0][:attributes][:user_id]).to be_an Integer
    expect(response[:data][0][:attributes][:name]).to be_a String
    expect(response[:data][0][:attributes][:phone_number]).to be_a String
  end

  it '#get_contact' do

    @tony = User.create!(name: "Tony Stark", email: "tonystark@gmail.com", token: "something", google_id: "somethingelse", phone_number: "303-333-1111")

    params1 = { name: "John Morris", phone_number: "111-222-3333", user_id: @tony.id }
    params2 = { name: "Bill Burke", phone_number: "444-555-6666", user_id: @tony.id }

    contact1 = ContactsFacade.create_contact(params1)
    contact2 = ContactsFacade.create_contact(params2)

    response = ContactsService.get_contact(contact1.contact_id)
    expect(response).to be_a Hash
    expect(response[:data][:id]).to be_a String
    expect(response[:data][:attributes][:user_id]).to be_an Integer
    expect(response[:data][:attributes][:name]).to be_a String
    expect(response[:data][:attributes][:phone_number]).to be_a String
  end

  it '#create_contact', :vcr do
    user_id = 2
    params = { name: "John Morris", phone_number: "303-249-3081", user_id: user_id }
    response = ContactsService.create_contact(params)

    expect(response).to be_a Hash
    expect(response[:data][:attributes][:user_id]).to eq(2)
    expect(response[:data][:attributes][:name]).to eq("John Morris")
    expect(response[:data][:attributes][:phone_number]).to eq("303-249-3081")
  end

  it '#edit_contact' do
    user = User.create!(name: "Bill Burke", email: "bill@gmail.com", token: "48575656453", google_id: "302-493-2954")
    user_id = user.id

    params = { name: "Stephanie", phone_number: "970-249-6781", user_id: user_id }
    contact = ContactsFacade.create_contact(params)
    # contact_id = contact.id
    params = { phone_number: "111-111-1111" }
    ContactsFacade.edit_contact(params, contact.contact_id)
  end


  it '#delete_contact' do
    @tony = User.create!(name: "Tony Stark", email: "tonystark@gmail.com", token: "something", google_id: "somethingelse", phone_number: "303-333-1111")

    params1 = { name: "John Morris", phone_number: "111-222-3333", user_id: @tony.id }
    params2 = { name: "Bill Burke", phone_number: "444-555-6666", user_id: @tony.id }

    contact1 = ContactsFacade.create_contact(params1)
    contact2 = ContactsFacade.create_contact(params2)

    ContactsService.delete_contact(contact1.contact_id)
    contacts = ContactsFacade.get_contacts(@tony.id)

    expect(contacts.count).to eq(1)
    expect(contacts).to_not include(contact1)
  end
end
