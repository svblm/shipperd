Rails.application.routes.draw do
  controller :session do
    get '/login', to: 'session#login'
    post '/session/create', to: 'session#create'
    get '/logout', to: 'session#logout'
  end

  resources :users
  resources :projects do
    resources :assets
  end

  controller 'dropbox' do
    get "/auth/:provider/callback", to: :link, as: :oauth2_callback
    get "/dropbox/unlink", to: :unlink, as: :dropbox_unlink
  end
end
