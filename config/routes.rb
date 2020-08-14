Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :listings, :requests
  get '/invite/:org_id', to: 'invite#register'
  post '/enroll', to: 'invite#enroll', as: :enroll
  get '/login', to: 'login#index', as: :login
  namespace :admin do
    resources :organizations
  end
end
