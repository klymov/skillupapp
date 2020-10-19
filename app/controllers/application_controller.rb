class ApplicationController < ActionController::Base
  before_action :current_user

  private

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

    # def logged_in?
  #   !current_user.nil?
  # end

  # def log_in(user)
  #   session[:user_id] = user.id
  # end

  def log_out
    session.delete(:user_id)
    @current_user = nil
  end

  def not_found
    render file: "#{Rails.root}/public/404", status: :not_found
  end
end
