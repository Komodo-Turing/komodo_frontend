class TimersController < ApplicationController

  def index
    user_id = session[:user_id]

    @user = User.find(user_id)
    @timers = TimersFacade.get_timers(user_id)
  end

  def new
  end

  def create
    @timer = TimersFacade.create_timers(timer_params)
    #redirect_to '/dashboard'
  end

  def edit
    @timer = Timer.find(params[:id])
  end

  def update
    timer = Timer.find(params[:id])
    timer.update(timer_params)

  end

  def show
    @timer = Timer.find(params[:id])

  end

  def destroy
    timer = Timer.find(params[:id])
    timer.destroy
  end

  private

  def timer_params
    params.permit(:user_id, :name, :duration, :substance, :dosage, :entry_instructions, :notes)
  end

end
#@timer = TimersFacade.create_timers(data: {attributes: {user_id: session[:user_id], name: params[:name], duration: params[:duration], substance: params[:substance], dosage: params[:dosage], entry_instructions: params[:entry_instructions], notes: params[:params]}})
