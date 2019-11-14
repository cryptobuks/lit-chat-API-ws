class UserMailer < ApplicationMailer
  default from: 'matthew.campbell@flatironschool.com'
 
  def welcome_email
    @user = params[:user]
    @url = params[:link]
    mail(to: @user.email, subject: 'LitChat: Thanks for signing up!')
  end

  def login_email
    @user = params[:user]
    @url = params[:link]
    mail(to: @user.email, subject: 'LitChat: Login')
  end
end
