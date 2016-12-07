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
        flash[:danger] = "Sorry, you're aren't allowed to access that."
        redirect_to("/#flash") unless current_user?(@user)
      end
end
