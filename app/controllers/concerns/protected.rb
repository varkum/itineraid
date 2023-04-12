module Protected
  extend ActiveSupport::Concern
  
  included do 
    before_action :match_user_id_to_current
  end 
  
  private 
  
  def kick_to_login_if_unauthenticated
    unless user_signed_in?
      redirect_to sign_in_path
    end 
  end 
  
  def match_user_id_to_current
    if params[:user_id].present? and Current.user.present?
      unless params[:user_id].to_i == Current.user.id
        render :file => "#{Rails.root}/public/404.html" 
      end
    end 
  end
  
end 
