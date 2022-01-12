class TimersController < ApplicationController

  def new
    @user_id = session[:user_id]
  end

  def create
    TimersFacade.create_timers(timer_params)
    redirect_to '/dashboard'
  end

  def edit
    @user_id = session[:user_id]
    @timer = TimersFacade.get_timer(params[:id])
  end

  def update
    require "pry"; binding.pry
    TimersFacade.update_timers(params[:id], timer_params)
    redirect_to '/dashboard'
  end

  def show
    @timer = TimersFacade.get_timer(params[:id])
  end

  def destroy
    TimersFacade.delete_timer(params[:id])
    redirect_to '/dashboard'
  end

  private

  def timer_params
    params.permit(:id, :user_id, :name, :duration, :substance, :dosage, :entry_instructions, :notes)
  end

end
