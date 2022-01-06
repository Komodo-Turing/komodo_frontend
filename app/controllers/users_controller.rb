class UsersController < ApplicationController

  def create
    auth_hash = request.env['omniauth.auth']

    name = auth_hash["info"]["name"]
    email = auth_hash["info"]["email"]
    token = auth_hash["credentials"]["token"]
    google_id = auth_hash["uid"]

    user = User.find_or_create_by(email: email)
    user.update(name: name, email: email, token: token, google_id: google_id)

    # session[:user_id] = user.id

    redirect_to '/dashboard'
  end
end

# don't forget phone number and address
