module Authenticate 
  extend ActiveSupport::Concern
  
  included do 
    before_action :authenticate_with_cookie
  end 
  
  private 
  def authenticate_with_cookie 
    if session[:user_id].present?
      Current.user = User.find(session[:user_id])
    end 
  end 
  
  def authenticate_with_credentials(email:, password:)
    user = User.find_by(email: email)
    if user.present? and user.authenticate(password)
      session[:user_id] = user.id
    end 
    user
  end 
  
  def user_signed_in?
    Current.user.present?
  end 
  
  def skip_login_screen_if_logged_in
    if user_signed_in?
      redirect_to root_path
    end 
  end 
end 