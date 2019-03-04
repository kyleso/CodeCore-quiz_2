class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:email])
    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:notice] = "Logged In Successfully"
      redirect_to root_path
    else
      flash[:warning] = "Wrong Email or Password"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "You Are Now Logged Out"
  end
end
