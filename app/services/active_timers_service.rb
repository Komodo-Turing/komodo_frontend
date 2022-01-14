class ActiveTimersService
  class << self
    def create_active_timer(params)
      response = conn.post("/api/v1/active_timers/?#{params}") do |f|
        f.params = params
      end
      parse_data(response)
    end

    def get_active_timer(id)
      response = conn.get("/api/v1/active_timers/#{id}")

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
