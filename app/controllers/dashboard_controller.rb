class DashboardController < ApplicationController
  def index
    user_id = session[:user_id]

    @user = User.find(user_id)
    @contacts = ContactsFacade.get_contacts(user_id)
    @timers = TimersFacade.get_timers(user_id)
  end
  #I think the easiest solution to limit to 5 contact would be to
  #just return the last five contact, and if there's more than 5 in
  #the database, we will check here and give a warning flash
end
