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

  it '#create_contact', :vcr do
    user_id = 2
    params = { name: "John Morris", phone_number: "303-249-3081", user_id: user_id }
    response = ContactsService.create_contact(params)

    expect(response).to be_a Hash
    expect(response[:data][:attributes][:user_id]).to eq(2)
    expect(response[:data][:attributes][:name]).to eq("John Morris")
    expect(response[:data][:attributes][:phone_number]).to eq("303-249-3081")
  end

  it '#edit_contact', :vcr do
    user = User.create!(name: "Bill Burke", email: "bill@gmail.com", token: "48575656453", google_id: "302-493-2954")
    user_id = user.id

    params = { name: "Stephanie", phone_number: "970-249-6781", user_id: user_id }
    contact = ContactsFacade.create_contact(params)
    # contact_id = contact.id
    params = { phone_number: "111-111-1111" }
    ContactsFacade.edit_contact(params, contact.contact_id)
  end

  # it "#delete_contact", :vcr do
  #   user = User.create!(name: "Bill Burke", email: "bill@gmail.com", token: "48575656453", google_id: "302-493-2954")
  #   user_id = user.id
  #
  #   params = { name: "Stephanie", phone_number: "970-249-6781", user_id: user_id }
  #   contact = ContactsFacade.create_contact(params)
  #   contact_id = contact.contact_id  #this should've been id instead of contact_id (in poro),but i am going to leave it as is
  #
  #   ContactsFacade.delete_contact(contact_id)
  #   contacts = ContactsFacade.get_contacts(user_id)
  #
  #   expect(contacts).to be_empty
  #   # expect(contacts.last.phone_number).to eq("970-249-6781")
  # end
end
