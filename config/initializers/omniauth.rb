Rails.application.config.middleware.use OmniAuth::Builder do
  provider :dropbox_oauth2, ENV['SHIPPERD_APP_KEY'], ENV['SHIPPERD_APP_SECRET']
end
