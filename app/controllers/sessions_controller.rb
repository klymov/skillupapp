class SessionsController < ApplicationController
  skip_before_action :check_for_authorization_in_cache, only: [:new, :create, :welcome]

  def new
  end

  def create
    user = User.find_by(username: params[:username])
    if user & user.authenticate(params[:password_digest])
      sessions[:user_id] = user.id
      # redirect_to '/welcome'
    else
      flash[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    redirect_to '/welcome'
  end

  def welcome
  end
end
