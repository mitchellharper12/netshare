Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/', to: 'home#index', as: :root
  resources :listings, :requests
  get '/invite/:org_id', to: 'invite#register'
  post '/enroll', to: 'invite#enroll', as: :enroll

  get '/login', to: 'login#index', as: :login
  post '/login', to: 'login#login'
  get '/logout', to: 'login#logout', as: :logout

  namespace :admin do
    resources :organizations
  end
end
