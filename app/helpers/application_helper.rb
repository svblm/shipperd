module ApplicationHelper
  def current_user
    @current_user = User.find(session[:user_id]) if @current_user.nil?
    @current_user
    rescue ActiveRecord::RecordNotFound
      nil
  end

end
