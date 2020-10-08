class User < ApplicationRecord
  attr_accessor :username, :password, :role, :email, :phone, :description
  # :avatar, :avto_id

  before_save { self.email = email.downcase }
  validates :username, presence: true, length: { minimum: 3, maximum: 21 }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
            format: { with: VALID_EMAIL_REGEX },
            uniqueness: { case_sensitive: false }

  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }
end
