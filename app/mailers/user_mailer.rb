class UserMailer < ApplicationMailer
  default from: 'matthew.campbell@flatironschool.com'
 
  def welcome_email
    @user = params[:user]
    # @url = params[:link]
    @url = 'http://example.com/login'
    mail(to: @user.email, subject: 'LitChat: Thanks for signing up!')
  end

  def login_email
    @user = params[:user]
    @url = params[:link]
    # @url = 'http://example.com/login'
    mail(to: @user.email, subject: 'LitChat: Login')
  end
end
  
  # first test out the code written in models/user that sends a user mail and makes use of this
  # controller without writing the UserMailer.send method. If that works, then don't perform the 
  # tasks below.

  # would have to write a UserMailer.send method that takes the argument of a template in order
  # to get this to run properly
