class ApplicationController < ActionController::Base
  include ApplicationHelper
  protect_from_forgery with: :exception
  before_filter :ensure_authenticated

  def ensure_authenticated
    if current_user.nil?
      redirect_to login_path, flash: {notice: "Please login to continue"}
    end
  end
end
