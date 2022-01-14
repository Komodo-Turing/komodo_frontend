class ActiveTimersController < ApplicationController
  def create
    timer = ActiveTimersFacade.create_active_timer(active_timer_params)
    redirect_to "/active_timers/#{timer.id}"
  end

  def show
    @timer = ActiveTimersFacade.get_active_timer(params[:id])
  end

  def update
    if params[:update_status]
      ActiveTimersFacade.update_active_timer(params[:id], {status: 'Stopped'})
      redirect_to '/dashboard'
      flash[:notice] = 'Your timer has been stopped.'
    end
  end

  private

  def active_timer_params
    params.permit(:user_id, :name, :start_time, :duration, :substance, :dosage, :entry_instructions, :notes, :status, :address, :user_name, :authenticity_token)
  end
end
