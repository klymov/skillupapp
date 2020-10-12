class UsersController < ApplicationController
  include SessionsHelper
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    session[:user_id] = @user.id
    if @user.save
      log_in @user
      flash[:success] = "Welcome to the SkillUpApp!"
      redirect_to @user
    else
      render 'new'
    end
  end

  def index
    @user = User.all
  end

  def show
    @user = User.find(params[:id])
    not_found if @user.nil?
  end

  def edit
    @user = User.find(params[:id])
    not_found if @user.nil?
  end

  def update
    @user = User.find(params[:id])
    not_found if @user.nil?

    if @user.update(user_params)
      redirect_to @user
    else
      render 'edit'
    end
  end

  private
  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation, :email, :role, :phone, :description)
  end
end
