Rails.application.config.middleware.use OmniAuth::Builder do
  provider :dropbox_oauth2, ENV['SHIPPERD_APP_KEY'], ENV['SHIPPERD_APP_SECRET']
end

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :github, ENV['GITHUB_KEY'], ENV['GITHUB_SECRET'], scope: "user,repo"
end
