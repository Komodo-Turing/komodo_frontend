class ContactsFacade
  class << self
    def get_contacts(user_id)
      contacts_data = ContactsService.get_contacts(user_id)
      if contacts_data[:data] != []
        contacts_data[:data].map do |contact_data|
          Contact.new(contact_data)
        end
      else
        []
      end
    end
  end
end
