Rails.application.routes.draw do
  controller :session do
    get '/login', to: 'session#login'
    post '/session/create', to: 'session#create'
    get '/logout', to: 'session#logout'
  end

  resources :users do
    get '/notifications', to: 'notification#index', as: 'notifications'
  end

  resources :projects do
    resources :assets do
      member do
        put '/ship', to: 'assets#ship', as: 'ship'
        get '/add-files', to: 'assets#add_files'
        put '/upload', to: 'assets#upload'
      end
      resources :comments
    end
    resources :invitations do
      member do
        get '/accept', to: 'invitations#accept', as: 'accept'
      end
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

  controller 'notification' do
    get "/notification/:id/read", to: :read, as: 'notification_read'
  end

  root to: "projects#index"
end
