class TimersFacade
  class << self
    def get_timers(user_id)
      all_timers = TimersService.get_timers(user_id)
      all_timers[:data].map do |timer|
        Timer.new(timer)
      end
    end

    def create_timers(params)
      timer_data = TimersService.create_timers(params)
      #require "pry"; binding.pry
      Timer.new(timer_data)
    end
  end
end
