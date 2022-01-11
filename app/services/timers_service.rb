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

    def update_timers(timer_id, params)
      response = conn.patch("/api/v1/timers/#{timer_id}") do |f|
        f.params = params
      end
      parse_data(response)
    end

    def get_timer(timer_id)
      response = conn.get("/api/v1/timers/#{timer_id}")

      parse_data(response)
    end

    # def delete_timer(timer_id)
    #   response = conn.delete("/api/v1/timers/#{timer_id}")
    #
    #   parse_data(response)
    # end

    private
    def conn
      Faraday.new("http://localhost:3000")
    end

    def parse_data(response)
      JSON.parse(response.body, symbolize_names: true)
    end
  end
end
