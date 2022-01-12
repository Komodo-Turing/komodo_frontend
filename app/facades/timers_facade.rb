class TimersFacade
  class << self
    def get_timers(user_id)
      all_timers = TimersService.get_timers(user_id)
      all_timers[:data].map do |timer|
        Timer.new(timer)
      end
    end

    def create_timers(params)
      TimersService.create_timers(params)
    end

    def get_timer(timer_id)
      timer_params = TimersService.get_timer(timer_id)[:data]
      Timer.new(timer_params)
    end

    def update_timers(timer_id, params)
      #timer_params = {timer: params.to_h}
      TimersService.update_timers(timer_id, params)
    end

    def delete_timer(timer_id)
      TimersService.delete_timer(timer_id)
    end
  end
end
