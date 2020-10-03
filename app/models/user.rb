class User < ApplicationRecord
  validates :nickname, presence: true, length: { minimum: 3, maximum: 21 }
  validates :password, presence: true, length: { in: 6..20 }
  validates :phone, presence: true, length: { minimum: 12, maximum: 12 }
  validates :email, presence: true, uniqueness: true, on: :create
end
