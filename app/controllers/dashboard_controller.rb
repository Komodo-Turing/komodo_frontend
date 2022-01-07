class DashboardController < ApplicationController
  def index
    user_id = session[:user_id]
    @user = User.find_by(user_id)
  end
end
