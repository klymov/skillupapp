class Order < ApplicationRecord
  validates :login, presence: true, length: { minimum: 3, maximum: 21 }
  validates :phone, presence: true, length: { minimum: 12, maximum: 12 }
  validates :description, presence: true, length: { minimum: 5, maximum: 128 }
end
