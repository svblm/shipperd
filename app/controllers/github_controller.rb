class GithubController < ApplicationController
  def link
    auth = request.env["omniauth.auth"]
    user = current_user
    user.github_token = auth["credentials"]["token"]
    if user.save
      redirect_to user_path(current_user), notice: "Github account linked."
    else
      redirect_to user_path(current_user), error: user.errors.full_messages.to_sentence
    end
  end

  def unlink
    user = current_user
    user.github_token = nil
    if user.save
      redirect_to user_path(current_user), notice: "Github account unlinked."
    else
      redirect_to user_path(current_user), error: user.errors.full_messages.to_sentence
    end
  end
end
