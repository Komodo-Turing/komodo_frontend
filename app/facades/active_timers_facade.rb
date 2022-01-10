class ActiveTimersFacade
  class << self
    def create_active_timer(params)
      active_timer_data = ActiveTimersService.create_active_timer(params)

      ActiveTimer.new(active_timer_data)
    end
  end
end