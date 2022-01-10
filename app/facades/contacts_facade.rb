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

    def create_contact(params)
      contact_data = ContactsService.create_contact(params)

      Contact.new(contact_data[:data])
    end

    def edit_contact(params, contact_id)
      ContactsService.edit_contact(params, contact_id)
    end

    def delete_contact(contact_id)
      ContactsService.delete_contact(contact_id)
    end
  end
end
