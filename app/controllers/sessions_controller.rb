class SessionsController < ApplicationController
  def new 
   skip_login_screen_if_logged_in
  end 
  
  def create
    if (user = authenticate_with_credentials email: params[:email], password: params[:password])
      redirect_to user_path(user.id)
    else 
      redirect_to sign_in_path, alert: "Your email or password was incorrect. Please try again"
    end 
  end 
  
  def destroy
    signout
    redirect_to root_path, notice: "You were successfully logged out"
  end 
  
  private 
  
  def signout
    session[:user_id] = nil
    Current.reset
  end 
end 

