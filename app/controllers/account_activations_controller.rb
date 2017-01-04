class AccountActivationsController < ApplicationController

  def edit
    user = User.find_by(email: params[:email])
    if user && !user.activated? && user.authenticated?(:activation, params[:id])  
      user.activate
      log_in user
      flash[:sucess] = "Account activated!"
      redirect_to user
    else
      flash[:danger] = "Invalid activation link!"
      redirect_to '/#flash'
    end
  end

end
