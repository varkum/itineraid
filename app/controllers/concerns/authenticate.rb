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
  
  def user_signed_in?
    Current.user.present?
  end 
  
  def skip_login_screen_if_logged_in
    if user_signed_in?
      redirect_to root_path
    end 
  end 
end 