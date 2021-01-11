class UsersController < ApplicationController
  LOCAL_PATH = "app/assets/images/avatars"

  def new
    @cities_collection = City.all.collect { |p| [ p.city, p.id ] }
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      log_in @user
      redirect_to @user
    else
      @cities_collection = City.all.collect { |p| [ p.city, p.id ] }
      render 'new'
    end
  end

  def index
    @user = User.all
  end

  def show
    # logged_in?
    @user = User.find_by_id(params[:id])
    not_found if @user.nil?
  end

  def edit
    @cities_collection = City.all.collect { |p| [ p.city, p.id ] }
    @user = User.find_by_id(params[:id])
    not_found if @user.nil?
  end

  def update
    @user = User.find_by_id(params[:id])
    not_found if @user.nil?
    filename = "#{@current_user.email.gsub(/[@.]/, "_")}"
    # expansion = @user["avatar"].split(".").last
    # File.open("#{LOCAL_PATH}/#{filename}.#{expansion}", 'wb') { |f| f.write(params[:user][:avatar].read) }
    # url_cloudinary = Cloudinary::Uploader.upload("#{LOCAL_PATH}/#{filename}.#{expansion}", folder: 'skillupapp/user')
    # binding.pry
    
    File.open("#{LOCAL_PATH}/#{filename}.png", 'wb') { |f| f.write(params[:user][:avatar].read) }
    url_cloudinary = Cloudinary::Uploader.upload("#{LOCAL_PATH}/#{filename}.png", folder: 'skillupapp/user')
    params[:user][:avatar] = url_cloudinary["public_id"].split("/").last

    if @user.update(user_params)
      redirect_to @user
    else
      render 'edit'
    end
  end

  private
  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation, :avatar, :email, :role, :city_id, :phone, :description)
  end
end
