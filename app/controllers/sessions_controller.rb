class SessionsController < ApplicationController
  skip_before_action :check_for_authorization_in_cache, only: [:new, :create, :welcome]

  def new
  end

  def create
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      sessions[:user_id] = user.id
      redirect_to '/welcome'
    end
  end

  def logout
  end

  def login
  end

  def welcome
  end

  def page_requires_login
  end
end
