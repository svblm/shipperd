class SessionController < ApplicationController
  skip_before_filter :ensure_authenticated, only: [:login, :create]
  def login
    @user = User.new
  end

  def create
    user = User.find_by_username!(login_params[:username])
    if user.authenticate(login_params[:password])
      session[:user_id] = user.id
      redirect_to user, flash: {notice: "Logged in."}
    else
      redirect_to login_path, flash: {notice: "Email or password is incorrect. Try again."}
    end
  rescue ActiveRecord::RecordNotFound
    redirect_to login_path, flash: {notice: "Email or password is incorrect. Try again."}
  end

  def logout
    reset_session
    redirect_to login_path, flash: {notice: "Logged out."}
  end

  private
  def login_params
    params.require(:user).permit(:username, :password)
  end
end
