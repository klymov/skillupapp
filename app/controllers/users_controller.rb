class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.create(params.require(:user).permit(:username, :password_digest, :role, :email, :phone, :description))
    session[:user_id] = @user.id
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

    if @user.update(order_params)
      redirect_to @order
    else
      render 'edit'
    end
  end

  private
  def order_params
    params.require(:order).permit(:username, :password_digest, :role, :email, :phone, :description)
  end
end
