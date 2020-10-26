class Order < ApplicationRecord
  enum status: [:new_order, :assigned, :in_progress, :completed]

  # through passenger_id
  has_many :users, class_name: "user", foreign_key: "passenger_id"
  # through passenger_id
  has_many :users, class_name: "user", foreign_key: "driver_id"

  # validates :login, presence: true, length: { minimum: 3, maximum: 21 }
  # validates :phone, presence: true, length: { minimum: 12, maximum: 12 }
  validates :description, presence: true, length: { minimum: 5, maximum: 128 }
end
