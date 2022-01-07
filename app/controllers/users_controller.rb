class UsersController < ApplicationController

  def update
    user_id = session[:user_id]
    @user = User.find(user_id)
    @user.update(phone_number: params[:phone_number])
    redirect_to '/dashboard'
  end
end
