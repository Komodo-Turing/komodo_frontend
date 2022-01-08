require "rails_helper"

RSpec.describe Contact do
  it "has attributes" do
    contact = Contact.new(contacts_data_for_test[:data][0])

    expect(contact.user_id).to eq(1)
    expect(contact.name).to eq("Stuart Mohr")
    expect(contact.phone_number).to eq("1-695-855-2883")
  end
end
