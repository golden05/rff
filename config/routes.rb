Rails.application.routes.draw do


  get "/admin/index", to: "admin#index"
  get "/login", to: 'sessions#new'
  post "/login", to: 'sessions#create'

  get 'users/index', to: 'users#index'
  get 'users/:id', to: 'users#show', as: :user
  get 'users/:id/edit', to: 'users#edit', as: :edit_user
  patch 'users/:id', to: 'users#update'
end
