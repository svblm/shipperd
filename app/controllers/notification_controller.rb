class NotificationController < ActionController::Base
  def read
    notification = Notification.find(params[:id])
    notification.read = true
    if notification.save
      if notification.mention?
        redirect_to asset_path(notification.comment.asset)
      else
        redirect_to :back
      end
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
end
