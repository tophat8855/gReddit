class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user, :authenticate_user

  def current_user
    User.find_by(id: session[:user_id])
  end

  def authenticate_user
    unless current_user
      redirect_to signin_path, notice: "You must log in to do that."
    end
  end
end
