class SessionsController < ApplicationController

  def create
    auth_hash = request.env['omniauth.auth']

    name = auth_hash["info"]["name"]
    email = auth_hash["info"]["email"]
    token = auth_hash["credentials"]["token"]
    google_id = auth_hash["uid"]


    if User.exists?(email: email)
      #if user is returning and already has a phone number
      user = User.find_by(email: email)
    else
      user = User.create(name: name, email: email, token: token, google_id: google_id)
      # Faraday.post("herokuurl/api/v1/users")  this will be how we store user information in heroku
    end

    session[:user_id] = user.id
    redirect_to '/dashboard'
  end

  def destroy
    session.delete(:user_id)
    redirect_to root_path
  end
end
