class DashboardController < ApplicationController
  def index
    user_id = session[:user_id]

    @user = User.find(user_id)
    @contacts = ContactsFacade.get_contacts(user_id)
    @timers = TimersFacade.get_timers(user_id)
  end
  
end
