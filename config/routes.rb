Rails.application.routes.draw do
  controller :session do
    get '/login', to: 'session#login'
    post '/session/create', to: 'session#create'
    get '/logout', to: 'session#logout'
  end

  resources :users
  resources :projects
end
