class AuthenticationController < ApplicationController
  skip_before_filter :authenticate_user
  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path, notice: "Time to party!"
    else
      @sign_in_error = "Username / password combination is invalid"
      render :new
    end
  end

  def new
  end

  def destroy
    session.destroy
    redirect_to root_path, notice: "See you later!"
  end
end
