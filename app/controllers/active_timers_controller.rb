class ActiveTimersController < ApplicationController
  def create
    ActiveTimersFacade.create_active_timer(active_timer_params)
  end

  def update
    if params[:update_status]
      ActiveTimersFacade.update_active_timer(params[:id], {status: 'Stopped'})
    end
  end

  private

  def active_timer_params
    params.permit(:user_id, :name, :start_time, :duration, :substance, :dosage, :entry_instructions, :notes, :status)
  end
end
