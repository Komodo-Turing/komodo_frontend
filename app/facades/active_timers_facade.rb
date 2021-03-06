class ActiveTimersFacade
  class << self
    def create_active_timer(params)
      active_timer_data = ActiveTimersService.create_active_timer(params)[:data]

      ActiveTimer.new(active_timer_data)
    end

    def update_active_timer(id, params)
      active_timer_data = ActiveTimersService.update_active_timer(id, params)
    end

    def get_active_timer(active_timer_id)
      active_timer_params = ActiveTimersService.get_active_timer(active_timer_id)
      
      ActiveTimer.new(active_timer_params[:data])
    end
  end
end
