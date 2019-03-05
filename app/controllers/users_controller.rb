class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :update]
  before_action :find_user, only: [:edit, :update]
  before_action :authorize_user!, only: [:edit, :update]

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "Signed Up Successfully!"
      redirect_to root_path
    else
      flash[:warning] = "You Entered Something Incorrectly"
      render :new
    end
  end

  def edit
  end

  def update
    if @user.update user_params
      flash[:success] = "Personal Info Updated!"
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(
      :name, :email, :password, :password_confirmation
    )
  end

  def find_user
    @user = User.find(params[:id])
  end

  def authorize_user!
    redirect_to root_path, alert: "Access Denied: You Can Only Edit Your Own Info!" unless can? :update, @user
  end
end
