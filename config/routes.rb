Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :listings, :requests
  get '/invite/:org_id', to: 'invite#register'
  post '/invite/enroll', to: 'invite#enroll'
  namespace :admin do
    resources :organizations
  end
end
