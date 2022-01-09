class TimersService
  class << self
    def get_timers(user_id)
      response = conn.get("/api/v1/timers/?user_id=#{user_id}")
      parse_data(response)

    end

    def create_timers(params)
      response = conn.post("/api/v1/timers") do |f|
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
