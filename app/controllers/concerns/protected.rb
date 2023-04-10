module Protected
  extend ActiveSupport::Concern
  
  private 
  
  def kick_to_login_if_unauthenticated
    unless user_signed_in?
      redirect_to sign_in_path
    end 
  end 
  
end 
