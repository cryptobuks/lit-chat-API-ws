class User < ApplicationRecord
  has_many :messages, dependent: :destroy
  has_many :user_chats, dependent: :destroy
  has_many :chats, through: :user_chats

  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true

  def first_name
    self.fullname.split(" ")[0]
  end

  def last_name
    self.fullname.split(" ")[1]
  end

  def send_signin_link
    generate_login_token
    @link = self.login_link
    UserMailer.with( user: self, link: @link ).welcome_email.deliver_now
  end

  def send_login_link
    generate_login_token
    @link = self.login_link
    UserMailer.with( user: self, link: @link ).login_email.deliver_now
  end

  def generate_login_token
    self.login_token = generate_token
    self.token_generated_at = Time.now.utc
    save!
  end

  def login_link
    "http://#{ENV['HOST']}/api/v1/auth/#{self.id}/#{self.login_token}"
  end

  def login_token_expired?
    Time.now.utc > (self.token_generated_at + token_validity)
  end

  def expire_token!
    self.login_token = nil
    save!
  end

  def self.find_user_by(value)
    where(["username = :value OR email = :value", {value: value}]).first
  end

  def valid_token?(token)
    self.login_token == token 
  end

  private

  def generate_token
    SecureRandom.hex(10)
  end

  def token_validity
    10.minutes
  end

end
# build out a way to not allow users to submit values for a username or email that contains spaces