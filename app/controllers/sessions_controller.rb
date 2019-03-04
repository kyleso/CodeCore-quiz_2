class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:email])
    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:notice] = "You Are Now Logged In"
      if session[:return_to].present?
        redirect_to session.delete(:return_to)
        flash[:notice] = "Logged In Successfully"
      else
        redirect_to root_path
      end
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
