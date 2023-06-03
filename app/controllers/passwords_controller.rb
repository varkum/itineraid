class PasswordsController < ApplicationController
  def edit 
    @user = Current.user
  end 
  
end 