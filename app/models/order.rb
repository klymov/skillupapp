class Order < ApplicationRecord
  enum status: [:new_order, :assigned, :in_progress, :completed]

  has_many :users, class_name: "user", foreign_key: "passenger_id"

  validates :description, presence: true, length: { minimum: 5, maximum: 128 }
end
