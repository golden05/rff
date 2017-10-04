Rails.application.routes.draw do


  get "/admin/index", to: "admin#index"
  get "/login", to: 'sessions#new'
  post "/login", to: 'sessions#create'

  resources :users
end
