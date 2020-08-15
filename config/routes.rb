Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/', to: 'home#index', as: :root
  #resources :listings, :requests
  get '/invite/:org_id', to: 'invite#register'
  post '/enroll', to: 'invite#enroll', as: :enroll

  get '/login', to: 'login#index', as: :login
  post '/login', to: 'login#login'
  get '/logout', to: 'login#logout', as: :logout

  get '/my_requests', to: 'request#my_requests', as: :my_requests
  get '/request', to: 'request#new', as: :new_request
  post '/request', to: 'request#create', as: :create_request
  post '/request/:request_id/delete', to: 'request#destroy', as: :delete_request

  get '/listing', to: 'listing#new', as: :new_listing
  post '/listing', to: 'listing#create', as: :create_listing
  post '/listing/:listing_id/delete', to: 'listing#destroy', as: :delete_listing

  namespace :admin do
    resources :organizations
  end
end
