class ApplicationController < ActionController::Base
  before_action :check_for_authorization_in_cache
  helper_method :logged_in?
  helper_method :current_user

  def current_user
    User.find_by(id: session[:user_id])
  end

  def logged_in?
    !current_user.nil?
  end

  def check_for_authorization_in_cache
    # remake. shouldn't fire when user registration
    # redirect_to '/welcome' unless logged_in?
  end

  def not_found
    render file: "#{Rails.root}/public/404", status: :not_found
  end
end
