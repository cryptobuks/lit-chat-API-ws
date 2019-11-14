# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview
  def welcome_email
    UserMailer.with(user: User.first, link: "http://localhost:3005/auth?token=login_token").welcome_email
  end
  def login_email
    UserMailer.with(user: User.first, link: "http://localhost:3005/auth?token=login_token").login_email
  end
end
