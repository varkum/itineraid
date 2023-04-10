class SessionsController < ApplicationController
  def new 
   skip_login_screen_if_logged_in
  end 
  
  def create
    if (user = sign_user_in_with email: params[:email], password: params[:password])
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
  
  def sign_user_in_with(email:, password:)
    user = User.find_by(email: email).authenticate(password)
    session[:user_id] = user.id
    return user
  end 
  
  def signout
    session[:user_id] = nil
    Current.reset
  end 
end 

