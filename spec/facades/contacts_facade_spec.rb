require "rails_helper"

RSpec.describe ContactsFacade do
  it "can call for user's contacts and construct contacts objects", :vcr do
    user_id = 1
    contacts = ContactsFacade.get_contacts(user_id)

    # expect(contacts.count).to eq(5)
    expect(contacts.first.user_id).to eq(1)
    expect(contacts.first.name).to eq("Stuart Mohr")
  end

  it "can create a contact for a user" do
    user_id = 2
    params = { name: "John Morris", phone_number: "303-249-3081", user_id: user_id }

    ContactsFacade.create_contact(params)
    contacts = ContactsFacade.get_contacts(user_id)

    expect(contacts.last).to be_a Contact
    expect(contacts.last.name).to eq("John Morris")
    expect(contacts.last.phone_number).to eq("303-249-3081")
    expect(contacts.last.user_id).to eq(2)
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
    expect(contacts.last.name).to eq("John Morris")
    expect(contacts.last.phone_number).to eq("303-249-3081")
    expect(contacts.last.user_id).to eq(2)
  end
end
