class ApplicationController < ActionController::Base
  include ApplicationHelper
  protect_from_forgery with: :exception
  before_filter :ensure_authenticated
  after_action :handle_permissions

  def ensure_authenticated
    if current_user.nil?
      redirect_to login_path, flash: {notice: "Please login to continue"}
    end
  end

  def handle_permissions
    unless @project.nil? or @project.has_member?(current_user) or @project.new_record?
      raise ActionController::RoutingError.new('Not Found')
    end
  end
end
