class UsersController < ApplicationController

  def index
    @user = current_user
  end

  def new
    @user = User.new
    @photo = Photo.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "Thank you for signing up!"
      redirect_to users_path
    else
      render 'new'
    end
  end

  def show
    @user = current_user

  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end