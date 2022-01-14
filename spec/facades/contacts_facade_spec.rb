require "rails_helper"

RSpec.describe ContactsFacade do
  it "can call for user's contacts and construct contacts objects" do
    @tony = User.create!(name: "Tony Stark", email: "tonystark@gmail.com", token: "something", google_id: "somethingelse", phone_number: "303-333-1111")

    params1 = { name: "John Morris", phone_number: "111-222-3333", user_id: @tony.id }
    params2 = { name: "Bill Burke", phone_number: "444-555-6666", user_id: @tony.id }
    ContactsFacade.create_contact(params1)
    ContactsFacade.create_contact(params2)

    contacts = ContactsFacade.get_contacts(@tony.id)

    expect(contacts.count).to eq(2)
    expect(contacts.first.user_id).to eq(@tony.id)
    expect(contacts.first.name).to eq(params1[:name])
    expect(contacts.first.phone_number).to eq(params1[:phone_number])
  end

  it "#get_contacts returns an empty array if the user has no contact" do
    @tony = User.create!(name: "Tony Stark", email: "tonystark@gmail.com", token: "something", google_id: "somethingelse", phone_number: "303-333-1111")
    contacts = ContactsFacade.get_contacts(@tony.id)

    expect(contacts).to eq([])
  end

  it "can call for one contact by its id" do
    @tony = User.create!(name: "Tony Stark", email: "tonystark@gmail.com", token: "something", google_id: "somethingelse", phone_number: "303-333-1111")

    params1 = { name: "John Morris", phone_number: "111-222-3333", user_id: @tony.id }
    params2 = { name: "Bill Burke", phone_number: "444-555-6666", user_id: @tony.id }
    contact1 = ContactsFacade.create_contact(params1)
    contact2 = ContactsFacade.create_contact(params2)

    contact = ContactsFacade.get_contact(contact1.contact_id)

    expect(contact.user_id).to eq(@tony.id)
    expect(contact.name).to eq(params1[:name])
    expect(contact.phone_number).to eq(params1[:phone_number])
  end

  # it "#get_contact returns an empty array if there is no contact with the id" do
  #   @tony = User.create!(name: "Tony Stark", email: "tonystark@gmail.com", token: "something", google_id: "somethingelse", phone_number: "303-333-1111")
  #   params1 = { name: "John Morris", phone_number: "111-222-3333", user_id: @tony.id }
  #   contact1 = ContactsFacade.create_contact(params1)
  #
  #   non_existent_contact_id = contact1.contact_id.to_i + 1
  #
  #   contact2 = ContactsFacade.get_contact(non_existent_contact_id)
  #   expect(contact2).to eq([])
  # end

  it "can create a contact for a user" do
    @tony = User.create!(name: "Tony Stark", email: "tonystark@gmail.com", token: "something", google_id: "somethingelse", phone_number: "303-333-1111")
    params1 = { name: "John Morris", phone_number: "111-222-3333", user_id: @tony.id }
    contact1 = ContactsFacade.create_contact(params1)
    contact = ContactsFacade.get_contact(contact1.contact_id)

    expect(contact.user_id).to eq(@tony.id)
    expect(contact.name).to eq(params1[:name])
    expect(contact.phone_number).to eq(params1[:phone_number])
  end

  it "can edit a contact" do
    user = User.create!(name: "Bill Burke", email: "bill@gmail.com", token: "48575656453", google_id: "302-493-2954")
    user_id = user.id

    params = { name: "Stephanie", phone_number: "970-249-6781", user_id: user_id }
    contact = ContactsFacade.create_contact(params)
    # contact_id = contact.id
    params = { phone_number: "111-111-1111" }
    ContactsFacade.edit_contact(params, contact.contact_id)

    contacts = ContactsFacade.get_contacts(user_id)

    expect(contacts.last).to be_a Contact
    expect(contacts.last.name).to eq("Stephanie")
    expect(contacts.last.phone_number).to eq("111-111-1111")
    expect(contacts.last.user_id).to eq(user_id)
  end

  it "can delete a contact" do
    user = User.create!(name: "Bill Burke", email: "bill@gmail.com", token: "48575656453", google_id: "302-493-2954")
    user_id = user.id

    params = { name: "Stephanie", phone_number: "970-249-6781", user_id: user_id }
    contact = ContactsFacade.create_contact(params)
    contact_id = contact.contact_id  #this should've been id instead of contact_id (in poro),but i am going to leave it as is

    ContactsFacade.delete_contact(contact_id)
    contacts = ContactsFacade.get_contacts(user_id)

    expect(contacts).to be_empty
  end

end
