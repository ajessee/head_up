class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include LeadsHelper
  include SessionsHelper

    private

      # Before Filters

      # Confirms a logged in user
      def logged_in_user
        unless logged_in?
          store_location
          flash[:danger] = "Please log in."
          redirect_to login_url
        end
      end

      # Confirms the correct user
      def correct_user
        @user = User.find(params[:id])
        if !current_user?(@user)
        flash[:danger] = "Sorry, you're aren't allowed to access that."
        redirect_to("/#flash") 
        end
      end

      def admin_user
        if !current_user.admin?
        flash[:danger] = "Sorry, you've got to be an admin to access that."
        redirect_to("/#flash")
        end
      end
end
