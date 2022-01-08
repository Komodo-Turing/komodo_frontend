class DashboardController < ApplicationController
  def index
    user_id = session[:user_id]
    #require "pry"; binding.pry
    @user = User.find(user_id)
    @contacts = ContactsFacade.get_contacts(user_id)
  end
end
