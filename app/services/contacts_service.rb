class ContactsService
  class << self
    def get_contacts(user_id)
      response = conn.get("/api/v1/contacts/?user_id=#{user_id}")
      parse_data(response)
    end

    def create_contact(params = {})
      response = conn.post("/api/v1/contacts/") do |f|
        f.params = params
      end
      parse_data(response)
    end

    private
    def conn
      Faraday.new("http://localhost:3000")
    end

    def parse_data(response)
      JSON.parse(response.body, symbolize_names: true)
    end
  end
end
