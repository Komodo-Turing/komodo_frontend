require "rails_helper"

RSpec.describe ContactsFacade do
  it "constructs contacts objects", :vcr do
    user_id = 1
    contacts = ContactsFacade.get_contacts(user_id)

    expect(contacts.count).to eq(5)
    expect(contacts.first.user_id).to eq(1)
    expect(contacts.first.name).to eq("Stuart Mohr")
  end
end
