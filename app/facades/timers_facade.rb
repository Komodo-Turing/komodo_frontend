class TimersFacade
  class << self
    def get_timers(user_id)
      all_timers = TimersService.get_timers(user_id)
      all_timers[:data].map do |timer|
        Timer.new(timer)
      end
    end

    def create_timers(params)
      timer_params = {timer: params.to_h}
      TimersService.create_timers(timer_params)
    end

    def get_timer(timer_id)
      TimersService.get_timer(timer_id)
    end

    def update_timers(timer_id, params)
      timer = TimersService.update_timers(timer_id, params)
      #require "pry"; binding.pry
    end
  end
end
