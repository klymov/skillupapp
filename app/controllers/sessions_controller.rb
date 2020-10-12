class SessionsController < ApplicationController
  skip_before_action :check_for_authorization_in_cache, only: [:new, :create, :welcome]
  include SessionsHelper

  def new
  end

  def create
    # user = User.find_by(username: params[:username])
    user = User.find_by(username: params[:session][:username].downcase)
    if user && user.authenticate(params[:session][:password])
      # sessions[:user_id] = user.id
      log_in user
      redirect_to user
    else
      flash[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to home_url
  end

  def welcome
  end
end
