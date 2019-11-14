class Api::V1::SessionsController < ApplicationController

  def auth
    token = params[:token].to_s
    user_id = params[:user_id].to_i 
    user = User.find(user_id)
  
    if !user || !user.valid_token?(token)
      render json: { ok: false, message: 'Your link is invalid. Request for a new login link' }
    elsif user.login_token_expired?
      render json: { ok: false, message: 'Your login link has expired. Request for a new login link.' }
    else
      sign_in_user(user)
      # send the user an encrypted JWT, hide your JWT master key in .env
      render json: { ok: true, message: 'You have been signed in!'}
    end
  end

  # when a user clicks submit on a login form (to give
  # you either their username or email) try to find that
  # user by either value. If not found, return a fail 
  # message, if found, return a success message and send them
  # an email.
  def create
    value = params[:identifier].to_s
    user = User.find_user_by(value)
  
    if !user
      render json: { message: "Uh oh! We couldn't find the username / email. Please try again." }
    else
      user.send_login_link
      render json: { message: 'We have sent you the link to login to our app' }
    end
  end

end
