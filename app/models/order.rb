    User
     /\
 City   Countries


 User
|
City
|
Country


class Order < ApplicationRecord
  enum status: [:new_order, :assigned, :in_progress, :completed]

  has_one :passenger, class_name: "User", foreign_key: "passanger_id"
  has_one :driver, class_name: "User", foreign_key: "driver_id"

  validates :description, presence: true, length: { minimum: 5, maximum: 128 }
end
