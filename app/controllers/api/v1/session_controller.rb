class Api::V1::SessionController < ApplicationController

  def auth
    token = params[:token].to_s
    user_id = params[:user_id] 
    user = User.find_by(id: user_id)
  
    if !user || !user.valid_token?
      # alter below
      redirect_to root_path, notice: 'It seems your link is invalid. Try requesting for a new login link'
    elsif user.login_token_expired?
      # alter below
      redirect_to root_path, notice: 'Your login link has been expired. Try requesting for a new login link.'
    else
      sign_in_user(user)
      # alter below
      redirect_to root_path, notice: 'You have been signed in!'
    end
  end

  def create
    value = params[:value].to_s
    user = User.find_user_by(value)
  
    if !user
      # alter below
      redirect_to new_session_path, notice: "Uh oh! We couldn't find the username / email. Please try again."
    else
      user.send_login_link
      # alter below
      redirect_to root_path, notice: 'We have sent you the link to login to our app'
    end
  end

end
