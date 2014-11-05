class User < ActiveRecord::Base
  before_save { self.email = email.downcase }

  has_many :projects

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: {maximum: 255}, format: {with: VALID_EMAIL_REGEX}, uniqueness: true
  validates :password, length: { minimum: 6 }, confirmation: true

  def authenticate(log_password)
    self.password == log_password
  end



end
