class UsersController < ApplicationController
  URL_CLOUDINARY = "skillupapp/user/"
  LOCAL_PATH = "app/assets/images/avatars"
  def new
    @user = User.new
  end

  def create
    # binding.pry

    # 1
    # finalize - create image locally and then uplopad it
    # handle extension
    # File.open('image.jpg', 'wb') { |f| f.write(params[:user][:avatar]) }

    # 2
    # create separate action to upload photo and save public id to user table
    # Cloudinary::Uploader.upload(params[:user][:avatar], :folder => :URL_CLOUDINARY)


    @user = User.new(user_params)
    session[:user_id] = @user.id
    if @user.save
      log_in @user
      redirect_to @user
    else
      render 'new'
    end
  end

  def index
    @user = User.all
  end

  def show
    # logged_in?
    @user = User.find_by_id(params[:id])
    filename = "#{@user.email.gsub(/[@.]/, "_")}"
    @avatar = "avatars/#{filename}.jpg"
    # @downloaded = @photo.download
    not_found if @user.nil?
  end

  def edit
    @user = User.find_by_id(params[:id])
    not_found if @user.nil?
  end

  def update
    @user = User.find_by_id(params[:id])
    not_found if @user.nil?
    filename = "#{@current_user.email.gsub(/[@.]/, "_")}"
    File.open("#{LOCAL_PATH}/#{filename}.jpg", 'wb') { |f| f.write(params[:user][:avatar].read) }
    # it "should successfully upload a file from IO" do
    # File.open(TEST_IMG, "rb") do |f|
    #   result = Cloudinary::Uploader.upload(f, :tags => [TEST_TAG, TIMESTAMP_TAG])
    #   expect(result["width"]).to eq(TEST_IMG_W)
    # end

    # Cloudinary::Uploader.upload(file, options = {})

    if @user.update(user_params)
      redirect_to @user
    else
      render 'edit'
    end
  end

  private
  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation, :avatar, :email, :role, :phone, :description)
  end
end
