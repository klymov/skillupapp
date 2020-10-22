class OrderPolicy < ApplicationPolicy
  authorize :user
  def new?
    user.present?
  end
end
