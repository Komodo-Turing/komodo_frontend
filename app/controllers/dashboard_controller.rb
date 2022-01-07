class DashboardController < ApplicationController
  def index
    user_id = session[:user_id]
    @user = User.find(user_id)
  end
end
