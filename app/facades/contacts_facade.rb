class ContactsFacade
  class << self
    def get_contacts(user_id)
      contacts_data = ContactsService.get_contacts(user_id)
      contacts_data[:data].map do |contact_data|
        Contact.new(contact_data)
      end
    end
  end
end
