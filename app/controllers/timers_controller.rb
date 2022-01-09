class TimersController < ApplicationController

  def index
    user_id = session[:user_id]

    @user = User.find(user_id)
    @timers = TimersFacade.get_timers(user_id)
  end

  def new


  end 
end
