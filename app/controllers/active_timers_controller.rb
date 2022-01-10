class ActiveTimersController < ApplicationController
  def create
    ActiveTimersFacade.create_active_timer(params[:data])

    redirect_to active_timer_show_path()
  end

  def show

  end

  private

  def active_timer_params
    params.permit(:user_id, :name, :start_time, :duration, :substance, :dosage, :entry_instructions, :notes, :status)
  end
end