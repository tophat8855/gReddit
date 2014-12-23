class RegistrationsController < ApplicationController
  skip_before_filter :authenticate_user
  def new
    @user = User.new
  end

  def create
    @user = User.new(params.require(:user).permit(:user_name, :email, :password, :password_confirmation))
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path
    else
      render :new
    end
  end
end
