class DropboxController < ApplicationController
  def link
    auth = request.env["omniauth.auth"]
    user = current_user
    user.dropbox_token = auth["credentials"]["token"]
    if user.save
      redirect_to user_path(current_user), notice: "Dropbox account linked."
    else
      redirect_to user_path(current_user), error: user.errors.full_messages.to_sentence
    end
  end
end
