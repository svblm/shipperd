Rails.application.routes.draw do
  controller :session do
    get '/login', to: 'session#login'
    post '/session/create', to: 'session#create'
    get '/logout', to: 'session#logout'
  end

  resources :users
  resources :projects do
    resources :assets do
      put '/ship/', to: 'assets#ship', as: 'ship'
      resources :comments
    end
  end

  controller 'dropbox' do
    get "/auth/dropbox_oauth2/callback", to: :link, as: :dropbox_oauth2_callback
    get "/dropbox/unlink", to: :unlink, as: :dropbox_unlink
  end

  controller 'github' do
    get "/auth/github/callback", to: :link, as: :github_oauth2_callback
    get "/github/unlink", to: :unlink, as: :github_unlink
  end

end
