class NotificationController < ApplicationController
  def read
    notification = Notification.find(params[:id])
    notification.read = true
    if notification.save
      redirect_to notification.url
    else
      redirect_to :back, error: "Failed to resolve notification url."
    end
  end

  def read_all
    current_user.notifications.where { |n| n.read == false }.each do |notification|
      notification.read!
    end

    head :no_content
  end

  def index
    @user = User.find(params[:user_id])
    @notifications = @user.notifications.unread
  end
end
