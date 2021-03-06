class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  protected
    def current_user
      return unless session[:user_id]
      @current_user ||= User.find(session[:user_id])
    end

    def check_current_user
      unless current_user
        redirect_to "/" and return
      end
      true
    end

end
