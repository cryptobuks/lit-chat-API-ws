class ApplicationController < ActionController::API

  # later down the line you'd want to
  # 1) Encrypt the user.id value (Bcrypt)
  # 2) Save the value on the frontend
  # 3) Figure out a way to decrypt that value to get
  #    the same user when you refresh a page.
  # OR
  # 1) Use JWT according to how you were taught 
  #    in Mod 4 / 5 @ Access Labs.
  def sign_in_user(user)
    user.expire_token!
    session[:email] = user.email
  end
  
  def current_user
    User.find_by(email: session[:email])
  end

end
