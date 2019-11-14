class ApplicationController < ActionController::API

  # after building out a basic sign in + sign up + logged in page
  # using React:

  # 1) Use JWT according to how you were taught 
  #    in Mod 4 / 5 @ Access Labs.

  def sign_in_user(user)
    user.expire_token!
  end
  
  def current_user
    # ? Figure out if this is how we implemented things when we used JWT.
    User.find_by(email: session[:email])
  end

end
