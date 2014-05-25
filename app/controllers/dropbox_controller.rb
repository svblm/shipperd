class DropboxController < ApplicationController
  def link
    auth = request.env["omniauth.auth"]
    puts auth.to_json
    user = current_user
    user.dropbox_token = auth["credentials"]["token"]
    if user.save
      redirect_to user_path(current_user), notice: "Dropbox account linked."
    else
      redirect_to user_path(current_user), error: user.errors.full_messages.to_sentence
    end
  end

  def unlink
    user = current_user
    user.dropbox_token = nil
    if user.save
      redirect_to user_path(current_user), notice: "Dropbox account unlinked."
    else
      redirect_to user_path(current_user), error: user.errors.full_messages.to_sentence
    end
  end
end
