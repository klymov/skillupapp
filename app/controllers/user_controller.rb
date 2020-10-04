class UserController < ApplicationController
  skip_before_action :authorized, only: [:new, :create]

  def index
    @user = User.all
  end

  def show
    @user = User.find(params[:id]) rescue not_found
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(params.require(:user).permit(:username, :password))
    session[:user_id] = @user.id
    redirect_to '/welcome'
  end

  private
  def user_params
    params.require(:user).permit(:username, :password, :role, :phone, :email)
  end
end
