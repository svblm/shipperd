class UsersController < ApplicationController
  skip_before_filter :ensure_authenticated, only: [:create, :new]

  def show
    @user = User.find(params[:id])
  end

  def edit
  end

  def new
    @user = User.new
  end

  def create
    if @user = User.create(user_params)
      session[:user_id] = @user.id
      redirect_to user_path(@user), flash: {notice: "Account created."}
    else
      redirect_to new_user_path, flash: {errors: user.errors}
    end
  end

  private
  def user_params
    params.require(:user).permit(:email, :username, :password, :password_confirmation)
  end
end
